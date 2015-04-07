
# pending to see the devise thing

User.create(
  name: 'Alvaro Ortiz', 
  email: 'alvaro@furilo.com', 
  password: "alvarofu", 
  password_confirmation: "alvaro12",
  twitter_handle: 'furilo')
User.create(
  name: 'Reason Holder', 
  email: 'reason@holder.com', 
  password: "reasonho", 
  password_confirmation: "reasonho",
  twitter_handle: 'reasonholder')

# issues
Issue.create(
  title: 'Razones para no votar a Esperanza Aguirre',
  description: 'Esperanza Aguirre tiene una trayectoria política muy cuestionable para alguien que quiere volver a presentarse a unas elecciones. En esta lista apuntamos algunas de las razones por las que pensamos que NO debería poder ser representante público. Si quieres añadir razones por las que votarla, adelante ;)',
  locale: 'es',
  privacy_public: true,
  user: User.all[0])

Reason.create(
  title: 'Muchos de sus colaboradores cercanos estan implicados en casos de corrupcion',
  for: true,
  description: 'Descripcion de la reason in question',
  user: User.all[0],
  issue: Issue.all[0])

Reason.create(
  title: 'Tuvo un incidente de tráfico inaceptable en alguien que aspira a ser representante público',
  for: true,
  description: 'Descripcion de la reason in question',
  user: User.all[0],
  issue: Issue.all[0])

Reason.create(
  title: 'Ganó las elecciones a la Comunidad de Madrid por un escándalo de transfuguismo con muchos vínculos con su propio partido y que nunca se ha aclarado al 100%',
  for: true,
  description: 'Descripcion de la reason in question',
  user: User.all[0],
  issue: Issue.all[0])


# votes
Reason.all[0].liked_by User.all[0]
Reason.all[0].liked_by User.all[1]
Reason.all[1].liked_by User.all[0]
