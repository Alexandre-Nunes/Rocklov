describe " POST /equipos/{equipo_id}/bookings" do
  before(:all) do
    payload = { email: "alexandrefilho@yahoo.com", password: "Teste@123" }
    result = Sessions.new.login(payload)
    @mu_id = result.parsed_response["_id"]
  end

  context "solicitar locacao" do
    before(:all) do
      result = Sessions.new.login({ email: "rose@yahoo.com", password: "Teste@123" })
      francy_id = result.parsed_response["_id"]

      fender = {
        "thumbnail": Helpers::get_thumb("fender-sb.jpg"),
        "name": "Fender ",
        "category": "Cordas",
        "price": 150,
      }
      MongoDB.new.remove_equipo(fender[:name], francy_id)

      result = Equipos.new.create(fender, francy_id)
      fender_id = result.parsed_response["_id"]

      @result = Equipos.new.booking(fender_id, @mu_id)
    end
    it "deve retornar 200" do
      expect(@result.code).to eql 200
    end
  end
end
