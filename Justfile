build target="":
    nom build {{ if target != "" { ".#" + target } else { "" } }}
    attic push patroclus result
