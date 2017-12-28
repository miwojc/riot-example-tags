<movie-list>
    <!-- HTML Structure -->
    <table class="table">
        <tr each="{movies}" onclick="{selectMovie}">
            <th>{Title}</th>
            <td>{Year}</td>
        </tr>
    </table>

    <!-- CSS style -->
    <style>
    tr {
        cursor: pointer;
    }
    </style>

    <!-- JavaScript behavior -->
    <script>
        const self = this;
        self.movies = [];

        opts.bus.on('newMovieList', function(newList) {
            self.movies = newList;
            self.update();
        });

        self.selectMovie = function(event) {
            event.preventDefault();
            console.log(event.item);
            fetch('http://www.omdbapi.com/?apikey=e78b4fa0&i=' + event.item.imdbID, {
                method: 'GET',
            }).then(function(response) {
                response.json().then( function(movieResult) {
                    console.log(movieResult);
                    opts.bus.trigger('showMovie', movieResult);
                });
                // Send a message with results
            }).catch(function(reason) {
                console.log(reason);
            });
        }
    </script>
</movie-list>