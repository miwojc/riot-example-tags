<all-zones-dropdown>
    <select name="zones" onchange={setTime}>
        <option></option>
        <option each="{zone, i in zones}" value="{zone}">{zone}</option>
    </select>

    <script>
    const self = this;

    self.on('mount', () => {
        self.zones = moment.tz.names();
        console.log(self.zones);
        self.update();
    });

    setTime(e) {
        opts.bus.trigger('new_date_set', moment().tz(e.target.value).seconds(0));
    }
    </script>
</all-zones-dropdown>