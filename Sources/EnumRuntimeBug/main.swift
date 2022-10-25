import Echo

enum E1 {
  case c1(E2)
}
enum E2 {
  case c1(Bool)
  case c2(Bool)
  case c3(Any)
}

let metadata = reflect(E1.self) as! EnumMetadata
var root = E1.c1(.c2(true))
withUnsafeMutablePointer(to: &root) { pointer in
  let pointer = UnsafeMutableRawPointer(pointer)
  let tag = metadata.enumVwt.getEnumTag(for: pointer)

  print("tag", tag) // prints "tag 0" in debug, "tag 1" in release

  _ = metadata.descriptor.fields.records[Int(tag)] // 🛑
}
