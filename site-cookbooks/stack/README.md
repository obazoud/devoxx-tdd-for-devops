stack Cookbook
===============
Installs and configures stack: Tomcat, MySQL and JHipster

Usage
-----
Simply include the recipe where you want Stack installed.

e.g.
Just include `stack` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[stack]"
  ]
}
```

Build
-----

To view rake tasks
```bash
% rake -T
```

Run all style checks
```bash
% rake style
```

Run all unit tests
```bash
% rake unit
```

Run all integration tests
```bash
% rake integration
```

License and Authors
-------------------
Apache License 2.0
