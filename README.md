# Ferro Programming Language

---

## Language Guide

### 1. Module System and Imports

```rust
open std::io::{println, math::sqrt}
```

- Import modules and specific functions with destructuring.
- Modules are opened using the open keyword.

### 2. Structs and Methods

```rust
struct vec3(x: float, y: float, z: float)
```

- Define structs with fields and types.

### 3. Method Definition Inside Struct

```rust
fn magnitude() {
  return sqrt((x * x) + (y * y) + (z * z));
}
```

- Methods can be attached to structs, providing functionality tied to the data.

### 4. Method Implementation Across Structs

```rust
struct vec2(x: float, y: float) {
  impl vec3::magnitude::{x, y, 0} -> transformer -> clone := vec2
}
```

- Share methods across structs, adapting them as needed.

### 5. Functions with Specific Return Types

```rust
fn transformer(v: vec3) := vec2 {
  vec2(v.x, v.y)
}
```

- Use `:=` to specify return types for functions.

### 6. The `::` Operator for Binding

```rust
fn unit_vector(v: vec3) :: vec3 := vec3 {
  let mag = v.magnitude();
  return vec3((v.x / mag), (v.y / mag), (v.z / mag));
}
```

- Bind methods to structs using the `::` operator.

### 7. Entrypoint (main function)

```rust
fn main() {
  let v2 = vec2(1, 2);
  let v3_1 = vec3(1, 2, 3);
  let v3_2 = vec3(4, 5, 6);

  println(v2.magnitude());
  println(v3_1.magnitude());
}
```

- Ferro’s entry point function is similar to other languages, with method calls and variable declarations.

### 8. If-Else Statements and Mutable Variables

```rust
fn grater(v1: vec3, v2: vec3) -> int {
  let mut indicator = 0;

  if v1.magnitude() > v2.magnitude() {
    indicator = 1;
  } else if v2.magnitude() > v1.magnitude() {
    indicator = -1;
  }

  return indicator;
}
```

- Use `let mut` to declare mutable variables.
- Implement `if-else` statements for conditional logic.

### 9. Recursion Instead of Loops

Ferro doesn't allow traditional loops like for or while. Recursion is used instead to handle iterative tasks.

---

## Getting Started

### Prerequisites

To start working with Ferro, you need:

- **OCaml**: Ferro's core is written in OCaml, so make sure OCaml is installed.
- **Dune**: A build system for OCaml. Install it to manage your Ferro projects.

### Installation

1. Clone your forked repository:

```bash
git clone https://github.com/your-username/ferro
```

2. Navigate to the Ferro directory:

```bash
cd ferro
```

3. Install dependencies:

```bash
opam install . --deps-only
```

4. Build the project:

```bash
dune build
```

---
