const GraphQLClient = require('graphql-request').GraphQLClient;

describe('A user', function() {
    const self = this;
    beforeAll(() => {
        const endpoint = 'http://localhost:4000/graphiql';
        self.client = new GraphQLClient(endpoint, { headers: {} });
    });

    it('should register a new user', done => {
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
                console.log(res.users[0])
                expect(res.users[0].name).toContain('Ana Caroline Silva Vieira');
                done();
            })
    });
});