
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


Issue.create(
  title: 'Razones para usar Reasons.club',
  description: 'En la tradición de tomar de nuestra propia medicina aquí tienes una lista de razones por las que usar Reasons.club es una buena idea, o lo contrario',
  locale: 'es',
  privacy_public: true,
  user: User.all[0])
Reason.create(
  title: 'Te ayuda a organizar tus ideas sobre un tema',
  for: true,
  description: 'El mero hecho de pensar sobre todos los factores en torno a una decisión te ayuda a ordenar tus ideas al respecto',
  user: User.all[0],
  issue: Issue.all[1])
Reason.create(
  title: 'Recopila la opinión de varias personas sobre el tema',
  for: true,
  description: 'Si tienes que tomar una decisión entre varias personas, Reasons.club te permite que cada uno de ellos pueda listar sus razones, y los demás den su opinión sobre cada una de ellas.',
  user: User.all[0],
  issue: Issue.all[1])
Reason.create(
  title: 'Es rápido y fácil de usar',
  for: true,
  description: 'Y gratis, claro. Crea un nuevo club y comienza a anotar razones. ',
  user: User.all[0],
  issue: Issue.all[1])
Reason.create(
  title: 'Delimitar un tema a una lista de razones te hace perder perspectiva sobre otras posibilidades ',
  for: false,
  description: 'Cuando tienes que tomar una decisión no todo es blanco o negro. Hacer una lista de pros y contras dá demasiada presencia a ese blanco o negro. Si analices un tema o situación sin hacer una lista de pros y contras puedes concluir con opciones que ... ',
  user: User.all[0],
  issue: Issue.all[1])

# votes
Reason.all[0].liked_by User.all[0]
Reason.all[0].liked_by User.all[1]
Reason.all[1].liked_by User.all[0]
