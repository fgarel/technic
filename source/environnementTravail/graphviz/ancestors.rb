#!/bin/env ruby

require 'model'
require 'set'

id = ARGV[0].to_i

# Prevent double inclusion of a node $memo = Set.new

def filter_node(per)
  return nil if !per
  return nil if per.firstname.strip == "?" ||
         per.lastname.strip == "?" ||
         per.maidenname.strip == "?"
  return per
end

def node (per,color)
  return false if $memo.member?(per.pk)
  $memo << per.pk
  name = [per.firstname, per.middlename, per.lastname, per.maidenname]
  name = name.collect do |n| n && n != "" ? n : nil }.compact.join(" ")
  label = "#{name}\n#{per.birthdate} - #{per.deathdate}"
  puts " p#{per.pk} [ shape = box, style=\"filled\","+
       " fillcolor=\"#{color.to_s}\", label=\"#{label}\" ];"
  return true
end

def ancestors per

  father = filter_node(per.father)
  mother = filter_node(per.mother)

  pk = per.pk
  arrowhead = "normal"
  if mother and father
    merge = "m#{mother.pk}and#{father.pk}"
    if !$memo.member?(merge)
      puts " p#{merge} [ shape = point ]"
      puts " p#{merge} -> p#{pk} [ arrowtail=none ]"
      arrowhead = "none"
    else
      $memo << merge
    end
    pk = merge
  end

  if father
    if node(father,:green)
      puts " p#{father.pk} -> p#{pk} [ arrowhead=#{arrowhead} ]"
      ancestors(father)
    end
  end

  if mother
    if node(mother,:gold)
      puts " p#{mother.pk} -> p#{pk} [ arrowhead=#{arrowhead} ]"
      ancestors(mother)
    end
  end
end

def graph per
  puts "digraph ancestors {" 
  ode(per,:red)
  ancestors(per)
  puts "}"
end

per = Person[:id => id]
if !per
  puts "Unable to find #{id}"
  exit
end

graph(per)
