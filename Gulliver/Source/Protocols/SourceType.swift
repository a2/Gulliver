public protocol _SourceType: RecordType {
    typealias PersonState
    typealias GroupState
}

public protocol SourceType: _SourceType {
    var sourceKind: SourceKind { get }

    func newPerson<P: PersonType where P.State == PersonState>() -> P
    
    func newGroup<G: GroupType where G.State == GroupState>() -> G
}
