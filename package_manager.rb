#!/usr/bin/env ruby

def package_manager
  if system("command -v dnf > /dev/null 2>&1")
    :dnf
  elsif system("command -v brew > /dev/null 2>&1")
    :brew
  else
    puts "❌ Aucun gestionnaire de paquets trouvé (dnf ou brew)."
    exit 1
  end
end

def list_packages(manager)
  case manager
  when :dnf
    # rpm -qa = liste brute de tous les paquets installés
    `rpm -qa`.lines.map(&:strip).sort
  when :brew
    `brew list --formula`.lines.map(&:strip).sort
  end
end

def update_package(manager, pkg)
  case manager
  when :dnf
    system("sudo dnf update -y #{pkg}")
  when :brew
    system("brew upgrade #{pkg}")
  end
end

def remove_package(manager, pkg)
  case manager
  when :dnf
    system("sudo dnf remove -y #{pkg}")
  when :brew
    system("brew uninstall #{pkg}")
  end
end

# --- Programme principal ---
manager = package_manager
packages = list_packages(manager)

if packages.empty?
  puts "⚠️ Aucun paquet n’a été trouvé."
  exit
end

puts "💡 Tape le début du nom d’un paquet :"
print "> "
query = gets.strip.downcase

matches = packages.select { |p| p.downcase.include?(query) }

if matches.empty?
  puts "Aucun paquet ne correspond à '#{query}'."
  exit
end

puts "\n📦 Paquets trouvés :"
matches.first(20).each_with_index { |p, i| puts "#{i + 1}. #{p}" }
puts "(affichage limité à 20 résultats)\n\n" if matches.size > 20

print "Choisis un paquet (numéro) : "
index = gets.to_i - 1
pkg = matches[index]

unless pkg
  puts "Choix invalide."
  exit
end

puts "\nQue veux-tu faire avec '#{pkg}' ?"
puts "1. 🔄 Mettre à jour"
puts "2. 🗑 Supprimer"
print "> "
action = gets.to_i

case action
when 1
  puts "\n🔄 Mise à jour de #{pkg}..."
  update_package(manager, pkg)
when 2
  puts "\n🗑 Suppression de #{pkg}..."
  remove_package(manager, pkg)
else
  puts "Action inconnue."
end
