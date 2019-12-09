const GraphQLClient = require('graphql-request').GraphQLClient;
const timestamp = require('time-stamp');

describe('Stats Tests', function() {
    const self = this;
    beforeAll(() => {
        const endpoint = 'http://localhost:4000/graphiql';
        self.client = new GraphQLClient(endpoint, { headers: {} });
    });

    it('StatsTotal - without date definitions', done => {
        const query = `{
            statsTotal {
                visitsCount
                usersCount
                websitesCount
                visits {
                    timestamp
                    user {
                        id
                        name
                        email
                        dateOfBirth
                        gender
                    }
                }
                users {
                    id
                    name
                    email
                    dateOfBirth
                    gender
                }
                websites {
                    url
                    topic
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                expect(res.statsTotal).toBeDefined();
                expect(res.statsTotal.visitsCount).toBeDefined();
                expect(res.statsTotal.usersCount).toBeDefined();
                expect(res.statsTotal.websitesCount).toBeDefined();
                expect(res.statsTotal.visits).toBeDefined();
                expect(res.statsTotal.users).toBeDefined();
                expect(res.statsTotal.websites).toBeDefined();
                done();
            })
    });

    it('StatsTotal - with initial date', done => {
        const dateVisit = "2019-04-17T14:00:00Z";

        const query = `{
            statsTotal(
                initialTimestamp: "${dateVisit}"
            ) {
                visits {
                    timestamp
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                const checkTimeStamp =
                    res.statsTotal.visits.every(visit => {
                        const visitTimeStamp = new Date(timestamp.utc(visit.timestamp))
                        const currentDate = new Date(timestamp.utc(dateVisit))

                        return visitTimeStamp >= currentDate 
                    });

                expect(res.statsTotal).toBeDefined();
                expect(checkTimeStamp).toBeTruthy();
                expect(res.statsTotal.visits).toBeDefined();
                

                done();
            })
    });

    it('StatsTotal - with final date', done => {
        const dateVisit = "2019-04-17T14:00:00Z";

        const query = `{
            statsTotal(
                finalTimestamp: "${dateVisit}"
            ) {
                visits {
                    timestamp
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                const checkTimeStamp =
                    res.statsTotal.visits.every(visit => {
                        const visitTimeStamp = new Date(timestamp.utc(visit.timestamp))
                        const currentDate = new Date(timestamp.utc(dateVisit))

                        return visitTimeStamp <= currentDate 
                    });

                expect(res.statsTotal).toBeDefined();
                expect(checkTimeStamp).toBeTruthy();
                expect(res.statsTotal.visits).toBeDefined();
                

                done();
            })
    });

    
});