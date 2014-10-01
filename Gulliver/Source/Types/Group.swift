//
//  Group.swift
//  Gulliver
//
//  Created by Alexsander Akers on 9/9/14.
//  Copyright (c) 2014 Pandamonia LLC. All rights reserved.
//

public class Group : Record {

    internal override init(record: ABRecordRef) {
        super.init(record: record)
    }

    public convenience init() {
        let group: ABRecordRef = ABGroupCreate().takeRetainedValue()
        self.init(record: group)
    }

    public convenience init(inSource source: Source) {
        let group: ABRecordRef = ABGroupCreateInSource(source.recordRef).takeRetainedValue()
        self.init(record: group)
    }

    public var source: Source {
        let source: ABRecordRef = ABGroupCopySource(recordRef).takeRetainedValue()
        return Source(record: source)
    }

    public func allMembers() -> [Person] {
        let array = ABGroupCopyArrayOfAllMembers(recordRef).takeRetainedValue() as [ABRecordRef]
        return array.map({ Person(record: $0) })
    }

    public func allMembers(sortOrdering: SortOrdering) -> [Person] {
        let array = ABGroupCopyArrayOfAllMembersWithSortOrdering(recordRef, sortOrdering.rawValue).takeRetainedValue() as [ABRecordRef]
        return array.map({ Person(record: $0) })
    }

    public func add(member: Person) -> Result {
        var error: Unmanaged<CFErrorRef>? = nil
        if ABGroupAddMember(recordRef, member.recordRef, &error) {
            return .Success
        } else {
            return .Failure(error!.takeRetainedValue() as AnyObject as NSError)
        }
    }

    public func remove(member: Person) -> Result {
        var error: Unmanaged<CFErrorRef>? = nil
        if ABGroupRemoveMember(recordRef, member.recordRef, &error) {
            return .Success
        } else {
            return .Failure(error!.takeRetainedValue() as AnyObject as NSError)
        }
    }

}