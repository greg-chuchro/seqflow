# seqflow
Seqflow is a branching workflow designed for projects that need to maintain multiple versions at the same time.

1. create a feature branch named after a related issue number
2. implement the feature
3. squash, rebase, test, and review the feature branch
4. merge the feature branch to the main branch
5. close the related issue and delete the feature branch
6. push the change to a release branch
   - If a MAJOR change do nothing
   - If a MINOR change create a new vMAJOR.MINOR branch
   - If a PATCH change cherry pick it to every vMAJOR.MINOR branch
7. publish at any time

## Related projects
- [seqflow-merge](https://github.com/greg-chuchro/seqflow-merge)
- [dvo](https://github.com/greg-chuchro/dvo)
