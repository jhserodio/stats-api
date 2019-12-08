const GraphQLClient = require('graphql-request').GraphQLClient;
const sortNumbers = require('sort-numbers');

describe('User Tests', function() {
    const self = this;
    beforeAll(() => {
        const endpoint = 'http://localhost:4000/graphiql';
        self.client = new GraphQLClient(endpoint, { headers: {} });
    });

    it('check if user with id: 1 exist', done => {
        const query = `{
            user(id: 1) {
                name
                email
                gender
                dateOfBirth
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.user).toBeDefined();
                expect(res.user.name).toBeDefined();
                expect(res.user.email).toBeDefined();
                expect(res.user.gender).toBeDefined();
                expect(res.user.dateOfBirth).toBeDefined();
                done();
            })
    });

    it('check if user with id: 13 dont exist', done => {
        const query = `{
            user(id: 999) {
                name
                email
                gender
                dateOfBirth
            }
        }`;

        self.client.request(query)
            .catch(err => {
                expect(err).toBeDefined();
                done();
            })
    });

    it('check if user with email: joao.serodio@vnator.com exist', done => {
        const query = `{
            userByEmail(email: "joao.serodio@vnator.com") {
                name
                email
                gender
                dateOfBirth
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.userByEmail).toBeDefined();
                expect(res.userByEmail.name).toBeDefined();
                expect(res.userByEmail.email).toBeDefined();
                expect(res.userByEmail.gender).toBeDefined();
                expect(res.userByEmail.dateOfBirth).toBeDefined();
                done();
            })
    });

    it('check if user with email unformatted', done => {
        const query = `{
            userByEmail(email: "no-is-a-email") {
                name
                email
                gender
                dateOfBirth
            }
        }`;

        self.client.request(query)
            .catch(err => {
                expect(err).toBeDefined();
                done();
            })
    });

    it('check if user with email: no@no.com dont exist', done => {
        const query = `{
            userByEmail(email: "no@no.com") {
                name
                email
                gender
                dateOfBirth
            }
        }`;

        self.client.request(query)
            .catch(err => {
                expect(err).toBeDefined();
                done();
            })
    });

    it('check default config to query users', done => {
        const query = `{
            users {
                name
                email
                gender
                dateOfBirth
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.users.length).toBe(10);
                done();
            })
    });

    it('check query users with limit 11', done => {
        const query = `{
            users(limit: 11) {
                name
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.users.length).toBe(11);
                done();
            })
    });

    it('check query users with skip', done => {
        const query = `{
            users(skip: 1) {
                id
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(Number(res.users[0].id)).toBe(2);
                done();
            })
    });

    it('check query users with sort_order', done => {
        const query = `{
            users(sort_order: ASC) {
                id
            }
        }`;

        const queryDesc = `{
            users(sort_order: DESC) {
                id
            }
        }`;

        self.client.request(query)
            .then(res => {
                const result = res.users.map(user => Number(user.id));
                const ordenedWithSort = sortNumbers(result)

                expect(
                    result
                ).toEqual(ordenedWithSort);
            })

        self.client.request(queryDesc)
            .then(res => {
                const result = res.users.map(user => Number(user.id));
                const ordenedWithSort = sortNumbers(result).reverse()

                expect(
                    res.users.map(user => Number(user.id))
                ).toEqual(ordenedWithSort);
                done();
            })
    });

    it('check query users with sort_field', done => {
        const queryName = `{
            users(sort_field: NAME) {
                id
            }
        }`;

        const queryDate = `{
            users(sort_field: DATE_OF_BIRTH) {
                id
            }
        }`;

        const queryEmail = `{
            users(sort_field: EMAIL) {
                id
            }
        }`;

        self.client.request(queryName)
            .then(res => {
                const result = res.users.map(user => Number(user.id));
                const ordenedWithSort = result.sort()

                expect(
                    result
                ).toEqual(ordenedWithSort);
            })

        self.client.request(queryDate)
            .then(res => {
                const result = res.users.map(user => Number(user.id));
                const ordenedWithSort = result.sort()

                expect(
                    result
                ).toEqual(ordenedWithSort);
            })

        self.client.request(queryEmail)
            .then(res => {
                const result = res.users.map(user => Number(user.id));
                const ordenedWithSort = result.sort()

                expect(
                    result
                ).toEqual(ordenedWithSort);
                done();
            })
    });

    it('upsert users - new user', done => {

        const mock = {
            name: "Teste Request",
            email: "teste@teste.com",
            gender: "MALE",
            dateOfBirth: "1114-06-21",
        }

        const query = `mutation {
            upsertUser(
                name: "${mock.name}",
                email: "${mock.email}",
                gender: ${mock.gender},
                dateOfBirth: "${mock.dateOfBirth}",
            ) {
                name
                email
                gender
                dateOfBirth
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.upsertUser).toEqual(mock);
                expect(res.upsertUser.name).toBe(mock.name);
                expect(res.upsertUser.email).toBe(mock.email);
                expect(res.upsertUser.gender).toBe(mock.gender);
                expect(res.upsertUser.dateOfBirth).toBe(mock.dateOfBirth);
                done();
            })
    });


    it('upsert users - update user', done => {

        const mock = {
            name: "Teste Request",
            email: "teste@teste.com",
            gender: "MALE",
            dateOfBirth: "1114-06-21",
        }

        const mockUpdate = {
            name: "Update Test Name"
        }

        const query = `mutation {
            upsertUser(
                name: "${mock.name}",
                email: "${mock.email}",
                gender: ${mock.gender},
                dateOfBirth: "${mock.dateOfBirth}",
            ) {
                name
                email
                gender
                dateOfBirth
            }
        }`;

        const queryUpdate = `mutation {
            upsertUser(
                name: "${mockUpdate.name}",
                email: "${mock.email}",
            ) {
                name
                email
                gender
                dateOfBirth
            }
        }`;

        client = self.client.request(query)
            .then(res => {
                res.upsertUser
            });

        self.client.request(queryUpdate)
            .then(res => {
                expect(res.upsertUser).toEqual({
                    ...mock,
                    ...mockUpdate
                });
                done();
            })
    });
});