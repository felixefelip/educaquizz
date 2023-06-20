# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

if (Quiz::Record.count.zero?)
  ApplicationRecord.transaction do
    quiz_historia = Quiz::Record.create!(description: "História")

    Quiz::Question::Record.create!(description: "Qual o nome do presidente do Brasil que ficou conhecido como Jango",
                                   difficulty: 3,
                                   quiz_id: quiz_historia.id,
                                   alternative1: "Jânio Quadros",
                                   alternative2: "Jacinto Anjos",
                                   alternative3: "Getúlio Vargas",
                                   alternative4: "João Goulart",
                                   correct_answer: 3)

    Quiz::Question::Record.create!(description: "Em que ano foi descoberto o Brasil?",
                                   difficulty: 2,
                                   quiz_id: quiz_historia.id,
                                   alternative1: 1891,
                                   alternative2: 2010,
                                   alternative3: 1520,
                                   alternative4: 1500,
                                   correct_answer: 4)

    Quiz::Question::Record.create!(description: "Nós vimos em nossas aulas, a diferença entre tempos cronológico e histórico. Nas frases abaixo, assinale corretamente com a letra (C) aquele que se refere ao cronológico e com a letra (H) aquele que se refere ao tempo histórico.",
                                   difficulty: 2,
                                   quiz_id: quiz_historia.id,
                                   alternative1: "Tempo registrado em calendários, que pode ser agrupado em dias, semanas, meses, anos, décadas, séculos, milênios.",
                                   alternative2: "Forma de contagem do tempo utilizada para marcar as ações humanas na Terra, analisando ações de grupos humanos e suas interferências no espaço geográfico, na vida política, econômica, social, educacional, etc...",
                                   alternative3: "",
                                   alternative4: "",
                                   correct_answer: 2)

    Quiz::Question::Record.create!(description: "Nós vimos em nossas aulas que o tempo cronológico pode ser dividido de diversas formas, como meses, anos, séculos e milênios. Analise os fatos históricos abaixo e cite a qual século ele pertence: ",
                                   difficulty: 2,
                                   quiz_id: quiz_historia.id,
                                   alternative1: "Neil Armstrong foi o primeiro a pisar na Lua, em 1969, no século ________ ",
                                   alternative2: "Pedro Alvares Cabral chegou ao Brasil em 1500, no século ________",
                                   alternative3: "Bárbaros invadiram e derrubaram o Império Romano do Ocidente em 476, no século ________ ",
                                   alternative4: "As Torres Gêmeas sofreram um ataque terrorista em 2001, no século ________ ",
                                   correct_answer: 2)

    Quiz::Question::Record.create!(description: "Leia o texto abaixo depois responda às perguntas:
      Os idosos
      Envelhecer é uma grande vitória. Significa estar vivendo há muito tempo, já ter passado por várias experiências e testemunhado inúmeros acontecimentos. Conviver com os idosos é um privilégio, pois temos a possibilidade de partilhar toda essa memória, esse conhecimento acumulado sobre o mundo. Para a história, os idosos significam uma oportunidade única para recuperar informações sobre o passado. Mais do que isso, é a chance de preservar testemunhos e experiências de sujeitos que, em sua memória, nunca tiveram a oportunidade de registrar seu modo de vida, sua história. Ao trabalhar com o relato de pessoas idosas, o historiador estará utilizando uma fonte:",
                                   difficulty: 2,
                                   quiz_id: quiz_historia.id,
                                   alternative1: "Oral",
                                   alternative2: "Textual",
                                   alternative3: "Visual",
                                   alternative4: "Mídia interativa ",
                                   correct_answer: 2)

    quiz_ciencia = Quiz::Record.create!(description: "Ciências")

    Quiz::Question::Record.create!(description: "Em que ano foi descoberto o Brasil?",
                                   difficulty: 2,
                                   quiz_id: quiz_ciencia.id,
                                   alternative1: "a Terra apresenta forma oval e achatada nos pólos, e gira no sistema solar junto com a Lua, no movimento de rotação. ",
                                   alternative2: "a Terra apresenta uma forma cilíndrica e gira no sistema solar, junto com a Lua. ",
                                   alternative3: "a Terra apresenta aparência azulada, tem forma arredondada e achatada nos pólos e gira ao redor Sol, com o movimento de translação. ",
                                   alternative4: "a Terra apresenta uma forma oval e se movimenta sozinha no sistema solar.",
                                   correct_answer: 4)

    Quiz::Question::Record.create!(description: "Compare o modelo geocêntrico com o modelo heliocêntrico e responda: qual é a principal diferença entre eles?",
                                   difficulty: 2,
                                   quiz_id: quiz_ciencia.id,
                                   alternative1: "O centro do universo é representado pelo Sol no modelo 1 e pela Terra no modelo 2 e, em ambos, os astros giram ao redor deles.",
                                   alternative2: "O centro do universo é representado pela Terra no modelo 1 e pelo Sol no modelo 2 e, em ambos, os astros se movimentam ao redor deles. ",
                                   alternative3: "Os dois modelos apresentam a Terra como o centro do universo e os astros estão parados.",
                                   alternative4: "Os dois modelos apresentam o Sol como o centro do universo e os astros estão parados.",
                                   correct_answer: 2)

    Quiz::Question::Record.create!(description: "“Dona Benta continuava com os olhos nas estrelas. Súbito, Narizinho, que estava em outro degrau da escada fazendo tricô, deu um berro. - Vovó, Emília está botando a língua para mim! Mas Dona Benta não ouviu. Não tirava os olhos das estrelas. Estranhando aquilo, os meninos foram se aproximando. E ficaram também a olhar para o céu, em procura do que estava prendendo a atenção da boa velha. - Que é, vovó, que a senhora está vendo lá em cima? Eu não estou enxergando nada – disse Pedrinho. Dona Benta não pode deixar de rir-se. Pôs nele os olhos, puxou-o para o seu colo e falou: - Não está vendo nada, meu filho? Então olha para o céu estrelado e não vê nada? - Só vejo estrelinhas – murmurou o menino. - E acha pouco, meu filho? Você vê uma metade do universo e acha pouco? Pois saiba que os astrônomos passam a vida inteira estudando as maravilhas que há nesse céu em que você só vê estrelinhas. É que eles sabem e você não sabe. “Eles sabem ler o que está escrito no céu – e você nem desconfia que haja um milhão de coisas escritas no céu...”
                                    ( Extraído do livro Viagem ao Céu, de Monteiro Lobato. 36° ed. São Paulo, Brasiliense, 1988. p.12) Estudando o céu, assim como o Pedrinho, você aprendeu sobre o universo na sua turma. Marque a frase correta:",
                                   difficulty: 2,
                                   quiz_id: quiz_ciencia.id,
                                   alternative1: "O universo é formado por um conjunto de galáxias e as “estrelinhas” vistas por Pedrinho pertencem à Via Láctea.",
                                   alternative2: "No céu, os astrônomos observaram que o universo é pequeno, formado só pelo Sol, Terra, Lua e Júpiter.",
                                   alternative3: "As “estrelinhas” vistas por Pedrinho são o próprio universo. ",
                                   alternative4: "A Terra, a Lua, o Sol, os outros planetas e os cometas são os únicos astros que formam o universo.",
                                   correct_answer: 2)
  end
end
