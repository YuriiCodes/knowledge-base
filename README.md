# Prolog Knowledge Base
## Task
1. Prolog;
2. A set of facts (assertions) with at least 25 initial facts;
3. A set of inference rules that allow for deriving new facts from the initial ones;
4. The fact set should include statements that form an ontology;
5. The ontology should have two types of relationships: taxonomic relationships "is_a" and part-whole relationships "part_of";
6. The ontology should include at least one subgraph tree with an "is_a" branching factor of at least 2 and a height of at least 3.

### Additional Explanations:

1. **Fact Set (at least 25 facts):**
   Facts are statements about objects and their relationships.
   Use the "is_a" and "part_of" relationships.

   Example:
   ```prolog
   is_a(cat, mammal).
   is_a(mammal, animal).
   part_of(engine, car).
   ```

2. **Set of Inference Rules:**
   Rules allow for deriving new facts based on existing ones.

   Example:
   ```prolog
   % Transitivity of taxonomic relationships
   is_a(X, Z) :- is_a(X, Y), is_a(Y, Z).

   % If X is part of Y, and Y is part of Z, then X is part of Z
   part_of(X, Z) :- part_of(X, Y), part_of(Y, Z).
   ```

3. **Building an Ontology with Two Types of Relationships:**
   - Taxonomic relationships (is_a): Represents "is" or "is a type of" relations.
   - Part-whole relationships (part_of): Represents "is part of" relations.

4. **Ontology Structure:**
   A tree with a branching factor of at least 2 and a height of at least 3.

   This means:
   - Branching Factor ≥ 2: Each node has at least 2 sub-nodes, for example, using "is_a".
   - Height ≥ 3: There are at least 3 levels from the root to a leaf.

   Example tree:
   ```
     musical_instrument
   ├── string_instrument
   │   ├── plucked_string_instrument
   │   │   ├── guitar
   │   │   └── bass_guitar
   │   └── bowed_string_instrument
   │       ├── violin
   │       └── cello
   ├── brass_instrument
   │   ├── valved_brass_instrument
   │   │   └── trumpet
   │   └── slide_brass_instrument
   │       └── trombone
   ├─ woodwind_instrument
   │   ├── single_reed_instrument
   │   │   ├── clarinet
   │   │   └── saxophone
   │   └── no_reed_instrument
   │       └── flute
   └── percussion_instrument
       ├── tuned_percussion_instrument
       │   ├── xylophone
       │   └── marimba
       └── untuned_percussion_instrument
           └── drum

   ```
   - Branching Factor: The node "animal" has 2 sub-nodes (mammal, bird).
   - Height: 3 levels (animal → mammal → cat).

### Steps for Minimum Completion:
1. **Choose a Subject Area**
   Examples: vehicles, animals, plants, machines, food, clothing, dishes, etc. – ensure your group's subject areas do not overlap.

2. **Create a Set of Facts**
   Write at least 25 facts using "is_a" and "part_of".

3. **Write Inference Rules**
   Rules may generally cover transitivity and inheritance.

4. **Verify Ontology Structure**
   Draw or visualize the tree to ensure that all requirements are met.


---
## My realisation
My subject area is musical instruments. Here's my Ontology Tree for Musical Instruments:

```
musical_instrument
├── string_instrument
│   ├── violin
│   ├── guitar
│   ├── piano
│   ├── bass_guitar
│   └── cello
├── brass_instrument
│   ├── trumpet
│   └── trombone
├─ woodwind_instrument
│   ├── flute
│   ├── clarinet
│   └── saxophone
└── percussion_instrument
    ├── drum
    ├── xylophone
    └── marimba
```
---
## Execution
### How to execute
Head over to [OneCompiler](https://onecompiler.com/prolog) & insert the source code there

### Execution results
````Guitar is a musical_instrument
Violin is a sound_producing_device
Saxophone is a musical_instrument
Marimba is a sound_producing_device
Drum is not a string_instrument
Flute is not a brass_instrument
String is part_of musical_instrument
Bow is part_of string_instrument
Hammer is part_of sound_producing_device
Drumstick is not part_of brass_instrument
Reed is not part_of piano```