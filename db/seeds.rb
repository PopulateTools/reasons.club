
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
  title: 'Razones para votar (o no) a Esperanza Aguirre',
  description: 'Esperanza Aguirre tiene una trayectoria política muy cuestionable para alguien que quiere volver a presentarse a unas elecciones. En esta lista apuntamos algunas de las razones por las que pensamos que NO debería poder ser representante público. Si quieres añadir razones por las que votarla, adelante ;)',
  locale: 'es',
  privacy_public: true,
  user: User.all[0])
Reason.create(
  title: 'Muchos de sus colaboradores cercanos estan implicados en casos de corrupcion',
  for: false,
  description: '',
  user: User.all[0],
  issue: Issue.all[0])
Reason.create(
  title: 'Tuvo un incidente de tráfico inaceptable en alguien que aspira a ser representante público',
  for: false,
  description: '',
  user: User.all[0],
  issue: Issue.all[0])
Reason.create(
  title: 'Ganó las elecciones a la Comunidad de Madrid por un escándalo de transfuguismo con muchos vínculos con su propio partido y que nunca se ha aclarado al 100%',
  for: false,
  description: '',
  user: User.all[0],
  issue: Issue.all[0])
Reason.create(
  title: 'La Fiscalia Anticorrupción, por un informe de la Agencia Tributaria, consideró que el PP de Madrid se financió de manera ilegal en 2003, el año del Tamayazo',
  for: false,
  description: '',
  user: User.all[0],
  issue: Issue.all[0])
Reason.create(
  title: 'Aguirre ha amparado en el PP de Madrid a Beltrán Gutiérrez, cesado por el PP nacional cuando se conoció que había gastado 58.000€ con su tarjeta "black" de Caja Madrid',
  for: false,
  description: 'Más información: http://www.eldiario.es/politica/PP-Madrid-contratar-exgerente-abandonar_0_326167445.html - Aguirre defiende de nuevo a Gutiérrez en una entrevista del día 13-04-2015: http://www.eldiario.es/politica/electores-esperaban-dieramos-ideologicas-Zapatero_0_375862925.html',
  user: User.all[0],
  issue: Issue.all[0])
Reason.create(
  title: 'La Comunidad de Madrid, cuando Aguirre estaba al frente, adjudicó a un familiar la gestión de unos terrenos protegidos para uso privado por un precio y condiciones de pago muy por debajo de mercado',
  for: false,
  description: 'Aquí toda la información: http://www.eldiario.es/sociedad/Madrid-adjudico-gestion-finca_0_375163109.html',
  user: User.all[0],
  issue: Issue.all[0])
Reason.create(
  title: 'Aguirre nombró y fué testigo en la boda de a Benjamín Martín Vasco, imputado en la Gurtel e implicado en un escándalo urbanístico en Arganda del Rey, del que Aguirre tenía noticias',
  for: false,
  description: 'Información: http://escolar.net/MT/archives/2009/03/3626.html y http://elpais.com/diario/2004/07/11/madrid/1089545065_850215.html',
  user: User.all[0],
  issue: Issue.all[0])
Reason.create(
  title: 'Aguirre resta importancia publicamente al uso de las Tarjetas Black',
  for: false,
  description: '"¿Y por qué hay que quitarle de su puesto de trabajo? No es un político. ¡Vamos a ver! Es que todo el que tiene una tarjeta black, en su vida privada sigue. Él es un administrativo." http://www.eldiario.es/politica/electores-esperaban-dieramos-ideologicas-Zapatero_0_375862925.html',
  user: User.all[0],
  issue: Issue.all[0])
Reason.create(
  title: 'Aguirre corta las conversaciones que le son incómodas',
  for: false,
  description: 'Lo ha hecho en esta entrevista http://www.eldiario.es/politica/electores-esperaban-dieramos-ideologicas-Zapatero_0_375862925.html y lo hizo con Jordi Évole ',
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



Issue.create(
  title: 'Razones para hacer deporte al aire libre (vs. ir al gimnasio)',
  description: 'Muchas personas pagan una cuota de un gimnasio cuando muchas veces podrían hacer deporte al aire libre ahorrando dinero y haciendo un ejercicio equivalente, y además, al aire libre.',
  locale: 'es',
  privacy_public: true,
  user: User.all[0])
Reason.create(
  title: 'Ahorras dinero',
  for: true,
  description: 'Es absurdo pagar por ir a un gimnasio cuando la gran mayoría de los ejercicios los puedes realizar de forma gratuita al aire libre (en un parque...)',
  user: User.all[0],
  issue: Issue.all[2])
Reason.create(
  title: 'Es más sano hacer ejercicio al aire libre',
  for: true,
  description: 'Al realizar ejercicio en un parque estás respirando aire fresco, al contrario que si lo haces dentro de un local cerrado como el de un gimnasio',
  user: User.all[0],
  issue: Issue.all[2])
Reason.create(
  title: 'Es más entretenido',
  for: true,
  description: 'Dentro de un gimnasio tienes siempre el mismo panorama, en el exterior puedes cambiar de recorrido, descubrir nuevos lugares...',
  user: User.all[0],
  issue: Issue.all[2])
Reason.create(
  title: 'Si vives en una ciudad grande, es menos peligroso ',
  for: false,
  description: 'Si vives en el centro de una ciudad grande sin un parque próximo, llegar hasta una zona apropiada para hacer deporte puede entrañar peligro por el tráfico, y por la polución a la que te enfrentas.',
  user: User.all[0],
  issue: Issue.all[2])
Reason.create(
  title: 'Si tienes poco tiempo y tienes que ducharte no hay otra opción que ir a un gimnasio',
  for: false,
  description: 'Después de hacer deporte es necesario poder darse una ducha. Si tienes poco tiempo, tu casa no está a mano, y tienes que volver al trabajo, ir al gimnasio tiene ventajas claras.',
  user: User.all[0],
  issue: Issue.all[2])
Reason.create(
  title: 'Es más fácil conocer gente',
  for: false,
  description: 'Para los que van al gimnasio para ligar. ',
  user: User.all[0],
  issue: Issue.all[2])
Reason.create(
  title: 'Hay determinados ejercicios que solo puedes realizar en un gimnasio',
  for: false,
  description: 'Si no dispones de máquinas hay determinados ejercicios que no podrás realizar.',
  user: User.all[0],
  issue: Issue.all[2])


# Issue.create(
#   title: 'Acerca de Reasons.club - Qué es y qué no es',
#   description: '',
#   locale: 'es',
#   privacy_public: true,
#   user: User.all[0])
# Reason.create(
#   title: t("home.for_yourself")+': '+t("home.for_yourself_1"),
#   for: true,
#   description: '',
#   user: User.all[0],
#   issue: Issue.all[3])



    # for_yourself: For yourself
    # for_yourself_1: Take quick notes about the issues you have to decide and get your ideas organized
    # for_yourself_2: Create drafts of pros and cons about the decisions you have to take
    # for_yourself_3: List reasons affecting the issues you have to work on
    # for_small_teams: For small teams
    # for_small_teams_1: Use Reasons.club with your partner, friends, coworkers, associates...
    # for_small_teams_2: Collaboratively create lists of pros and cons about the issues you have to decide on
    # for_small_teams_3: Have structured and organized debates about your decisions - avoid caotic email discussions without end nor results 
    # for_public_discussions: For public discussions
    # for_public_discussions_1: Hold public discussions with big groups while maintaining order
    # for_public_discussions_2: Let people add their reasons to a debate, or only vote for existing reasons
    # for_public_discussions_3: Gather feedback from many people about complex isuses with order and structure
    # some_example_public_clubs: Some example public clubs
    # reasons_for_using_reasons: Reasons for using Reasons.club
    # create_your_first_club: Create your first club


# votes
Reason.all[0].liked_by User.all[0]
Reason.all[0].liked_by User.all[1]
Reason.all[1].liked_by User.all[0]
