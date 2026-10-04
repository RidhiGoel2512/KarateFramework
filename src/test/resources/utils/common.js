function fn() {

    return {

        // Common headers
        getHeaders: function() {
            return {
                'Content-Type': 'application/json'
            };
        },

        // Headers for authenticated APIs
        getAuthHeaders: function(token) {
            return {
                'Content-Type': 'application/json',
                'Authorization': 'Bearer ' + token
            };
        }

    };
}