import { Controller } from "stimulus";

export default class extends Controller {
  initialize() {
    console.log("hello from city-selector controller");
    this.check_forms();
  }

  check_forms() {
    if (this.city.getAttribute("data-state-id").length > 0) {
      this.state.value = this.city.getAttribute("data-state-id");
      this.state_changed();
    }
  }

  state_changed() {
    var that = this;
    // alert(this.state_url)
    this.request_data(this.state_url, function(response) {
      for (let i = 0; i < that.county.options.length; i++) {
        that.county.options[i] = null;
      }

      that.county.appendChild(document.createElement("option"));

      for (let i = 0; i < response.length; i++) {
        var opt = document.createElement("option");
        // [NAME, ID, URL]
        opt.textContent = response[i][0];
        opt.value = response[i][1];
        opt.setAttribute("url", response[i][2]["url"]);
        that.county.appendChild(opt);
      }

      if (that.city.getAttribute("data-county-id").length > 0) {
        that.county.value = that.city.getAttribute("data-county-id");
        that.county_changed();
      }
    });
  }

  county_changed() {
    var that = this;
    // alert(this.county_url)
    this.request_data(this.county_url, function(response) {
      for (let i = 0; i < that.city.options.length; i++) {
        that.city.options[i] = null;
      }

      that.city.appendChild(document.createElement("option"));

      for (let i = 0; i < response.length; i++) {
        var opt = document.createElement("option");
        // [NAME, ID]
        opt.textContent = response[i][0];
        opt.value = response[i][1];
        that.city.appendChild(opt);
      }

      if (that.city.getAttribute("data-city-id").length > 0) {
        that.city.value = that.city.getAttribute("data-city-id");
      }
    });
  }

  get state() {
    return this.targets.find("state_input");
  }

  get state_url() {
    return this.state.selectedOptions[0].getAttribute("url");
  }

  get county() {
    return this.targets.find("county_input");
  }

  get county_url() {
    return this.county.selectedOptions[0].getAttribute("url");
  }

  get city() {
    return this.targets.find("city_input");
  }

  request_data(url, callback) {
    Rails.ajax({
      type: "GET",
      url: url,
      success: callback,
      error: function(response) {}
    });
  }
}
