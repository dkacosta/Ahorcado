# Juego del Ahorcado (Adivina la palabra)

# Encabezado principal
def titulo mensaje
  puts '    _    _                             _ '
  puts '   / \\  | |__   ___  _ __ ___ __ _  __| | ___ '
  puts '  / _ \\ | \'_ \\ / _ \\| \'__/ __/ _` |/ _` |/ _ \\'
  puts ' / ___ \\| | | | (_) | | | (_| (_| | (_| | (_) |'
  puts '/_/   \\_\\_| |_|\\___/|_|  \\___\\__,_|\\__,_|\\___/'
  puts "\n#{mensaje}\n\n"
end

# Inicializa las variables principales
def inicializar
  categoria = gets.to_i
  case categoria
  when 1
    load 'nombres_script.rb'
  when 2
    load 'apellidos_script.rb'
  else
    load 'verbos_script.rb'
  end

  @respuesta = []
  @intentos = 0
  # Inicializar @limite segun longitud de la palabra
  case @palabra.length
  when 0..4
    @limite = 7
  when 5..8
    @limite = 12
  when 9..15
    @limite = 20
  else
    @limite = 30
  end
  # Inicializar respuesta con guiones bajos
  @palabra.length.times do |x|
    @respuesta[x] = "_"
  end
  return @respuesta
end

# El usuario introduce letras
def responder
  while @respuesta.join != @palabra
    system("clear")
    titulo "Adivina la palabra"
    puts @respuesta.join(" ")
    puts "\nIntentos: #{@intentos}"
    print "\nEscribe una letra: "
    letra = gets.chomp
    # Incrementar @intentos si la letra no esta
    unless @palabra.include?(letra)
      @intentos += 1
    end
    # Interrumpir el ciclo si alcanza el limite de intentos
    break if @intentos >= @limite
    # Ciclo que busca y reemplaza letras
    @respuesta.length.times do |x|
      if @palabra[x] == letra
        @respuesta[x] = letra
      end
    end
  end
  system("clear")
  if @intentos >= @limite
    titulo "Perdiste! Intentalo de nuevo"
  else
    titulo "Felicidades, has ganado!!!"
  end
  puts "La palabra es: #{@palabra}\n\n"
end

# Ejecucion del programa
system("clear")
titulo "Elige una categoria\n1-Nombres\n2-Apellidos\n3-Verbos"
inicializar
responder
