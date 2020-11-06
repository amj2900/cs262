
App:https://morning-garden-73446.herokuapp.com/

a)  /property / /players /players/:id /players/:id /players /players/:id

b) /players/:id - idempotent (for updating player)
   /players - idempotent (to create players)
   /players/:id - idempotent (to delete players) 
   /property - nullipotent 
   /players - nullipotent 
   /players/:id - nullipotent 
   

c)Yes, the client and service are separate entities. The requests are stateless meaning they contain all the necessary information 
to interact with the uniform and layered interface.

d)It's possible depending on how the requests are handled in the code.