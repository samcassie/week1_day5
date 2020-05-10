def pet_shop_name(array)
    return array[:name]
end

def total_cash(array)
    return array[:admin][:total_cash]
end

def add_or_remove_cash(array, cash)
    array[:admin][:total_cash] += cash
    return array[:admin][:total_cash]
end

def pets_sold(array)
    return array[:admin][:pets_sold]
end

def increase_pets_sold(array, pets_sold)
    return array[:admin][:pets_sold] =+ pets_sold
end

def stock_count(array)
    return array[:pets].length()
end

def pets_by_breed(array, breed)
    pets = []
    for animal in array[:pets]
        if animal[:breed] == breed
            pets.append(breed)
        end
    end
    return pets
end

def find_pet_by_name(array, name)
    for pet in array[:pets]
        if pet[:name] == name
            return pet
        end
    end
    return
end

#
#

def remove_pet_by_name(array, name)
    for pet in array[:pets]
        if pet[:name] == name
            array[:pets].delete(pet)
            return pet
        end
    end
    return pet
end
#
#
#

def add_pet_to_stock(location, new_pet)
    location[:pets].append(new_pet)
end

def customer_cash(array)
    return array[:cash]
end

def remove_customer_cash(array, cash)
    array[:cash] -= cash
end

def customer_pet_count(array)
    return array[:pets].length()
end

def add_pet_to_customer(customer, new_pet)
    customer[:pets].append(new_pet)
end

#### Optional

def customer_can_afford_pet(customer, new_pet)
    if customer[:cash] >= new_pet[:price]
        return true
    else
        return false
    end
end

def sell_pet_to_customer(array, new_pet, customer)
    if array[:pets].include?new_pet
        if customer_can_afford_pet(customer, new_pet)
            add_pet_to_customer(customer, new_pet)
            remove_customer_cash(customer, new_pet[:price])
            add_or_remove_cash(array, new_pet[:price])
            array[:admin][:pets_sold] += 1
        end
        return
    end
    return
end
