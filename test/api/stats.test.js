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

    it('StatsTotal - with initial date greather than final date', done => {
        const finalDate = "2012-04-17T14:00:00Z";
        const initialDate = "2019-04-17T14:00:00Z";
        const query = `{
            statsTotal(
                finalTimestamp: "${finalDate}"
                finalTimestamp: "${initialDate}"
            ) {
                visits {
                    timestamp
                }
            }
        }`;

        self.client.request(query)
            .catch(err => {
                expect(err).toBeDefined();
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


    // ===========================================================================================
    // ========================= STATS BY WEBSITES ===============================================
    // ===========================================================================================

    it('statsByWebsite - without date definitions', done => {
        const query = `{
            statsByWebsite {
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
                expect(res.statsByWebsite).toBeDefined();
                expect(res.statsByWebsite.visitsCount).toBeDefined();
                expect(res.statsByWebsite.usersCount).toBeDefined();
                expect(res.statsByWebsite.websitesCount).toBeDefined();
                expect(res.statsByWebsite.visits).toBeDefined();
                expect(res.statsByWebsite.users).toBeDefined();
                expect(res.statsByWebsite.websites).toBeDefined();
                done();
            })
    });

    it('statsByWebsite - with final date', done => {
        const dateVisit = "2019-04-17T14:00:00Z";
        const query = `{
            statsByWebsite(
                finalTimestamp: "${dateVisit}",
            ) {
                visits {
                    timestamp
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                const checkTimeStamp =
                    res.statsByWebsite.visits.every(visit => {
                        const visitTimeStamp = new Date(timestamp.utc(visit.timestamp))
                        const currentDate = new Date(timestamp.utc(dateVisit))

                        return visitTimeStamp <= currentDate 
                    });

                expect(res.statsByWebsite).toBeDefined();
                expect(checkTimeStamp).toBeTruthy();
                expect(res.statsByWebsite.visits).toBeDefined();
                

                done();
            })
    });

    it('statsByWebsite - with initial date', done => {
        const dateVisit = "2019-04-17T14:00:00Z";
        const query = `{
            statsByWebsite(
                initialTimestamp: "${dateVisit}",
            ) {
                visits {
                    timestamp
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                const checkTimeStamp =
                    res.statsByWebsite.visits.every(visit => {
                        const visitTimeStamp = new Date(timestamp.utc(visit.timestamp))
                        const currentDate = new Date(timestamp.utc(dateVisit))

                        return visitTimeStamp >= currentDate 
                    });

                expect(res.statsByWebsite).toBeDefined();
                expect(checkTimeStamp).toBeTruthy();
                expect(res.statsByWebsite.visits).toBeDefined();
                

                done();
            })
    });

    it('statsByWebsite - with initial date greather than final date', done => {
        const finalDate = "2012-04-17T14:00:00Z";
        const initialDate = "2019-04-17T14:00:00Z";
        const query = `{
            statsByWebsite(
                finalTimestamp: "${finalDate}"
                finalTimestamp: "${initialDate}"
            ) {
                visits {
                    timestamp
                }
            }
        }`;

        self.client.request(query)
            .catch(err => {
                expect(err).toBeDefined();
                done();
            })
    });

    it('statsByWebsite - with gender filter', done => {
        const gender = "MALE";
        const query = `{
            statsByWebsite(
                gender: ${gender},
            ) {
                users {
                    id
                    gender
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                const checkTimeStamp =
                    res.statsByWebsite.users.every(visit => visit.gender === gender);

                expect(res.statsByWebsite).toBeDefined();
                expect(checkTimeStamp).toBeTruthy();
                expect(res.statsByWebsite.users).toBeDefined();
                

                done();
            })
    });

    // ===========================================================================================
    // ========================= STATS BY USERS ===============================================
    // ===========================================================================================

    it('statsByUser - without date definitions', done => {
        const query = `{
            statsByUser {
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
                expect(res.statsByUser).toBeDefined();
                expect(res.statsByUser.visitsCount).toBeDefined();
                expect(res.statsByUser.usersCount).toBeDefined();
                expect(res.statsByUser.websitesCount).toBeDefined();
                expect(res.statsByUser.visits).toBeDefined();
                expect(res.statsByUser.users).toBeDefined();
                expect(res.statsByUser.websites).toBeDefined();
                done();
            })
    });

    it('statsByUser - with final date', done => {
        const dateVisit = "2019-04-17T14:00:00Z";
        const query = `{
            statsByUser(
                finalTimestamp: "${dateVisit}",
            ) {
                visits {
                    timestamp
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                const checkTimeStamp =
                    res.statsByUser.visits.every(visit => {
                        const visitTimeStamp = new Date(timestamp.utc(visit.timestamp))
                        const currentDate = new Date(timestamp.utc(dateVisit))

                        return visitTimeStamp <= currentDate 
                    });

                expect(res.statsByUser).toBeDefined();
                expect(checkTimeStamp).toBeTruthy();
                expect(res.statsByUser.visits).toBeDefined();
                

                done();
            })
    });

    it('statsByUser - with initial date', done => {
        const dateVisit = "2019-04-17T14:00:00Z";
        const query = `{
            statsByUser(
                initialTimestamp: "${dateVisit}",
            ) {
                visits {
                    timestamp
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                const checkTimeStamp =
                    res.statsByUser.visits.every(visit => {
                        const visitTimeStamp = new Date(timestamp.utc(visit.timestamp))
                        const currentDate = new Date(timestamp.utc(dateVisit))

                        return visitTimeStamp >= currentDate 
                    });

                expect(res.statsByUser).toBeDefined();
                expect(checkTimeStamp).toBeTruthy();
                expect(res.statsByUser.visits).toBeDefined();
                

                done();
            })
    });

    it('statsByUser - with initial date greather than final date', done => {
        const finalDate = "2012-04-17T14:00:00Z";
        const initialDate = "2019-04-17T14:00:00Z";
        const query = `{
            statsByUser(
                finalTimestamp: "${finalDate}"
                finalTimestamp: "${initialDate}"
            ) {
                visits {
                    timestamp
                }
            }
        }`;

        self.client.request(query)
            .catch(err => {
                expect(err).toBeDefined();
                done();
            })
    });

    it('statsByUser - with gender filter', done => {
        const gender = "MALE";
        const query = `{
            statsByUser(
                gender: ${gender},
            ) {
                users {
                    id
                    gender
                }
            }
        }`;

        self.client.request(query)
            .then(res => {
                const checkTimeStamp =
                    res.statsByUser.users.every(visit => visit.gender === gender);

                expect(res.statsByUser).toBeDefined();
                expect(checkTimeStamp).toBeTruthy();
                expect(res.statsByUser.users).toBeDefined();
                

                done();
            })
    });
});