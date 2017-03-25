#!/usr/bin/ruby

class matchMe

	# the users being checked for matchability
	# TODO: actually fetch them right because this is probably not gonna work
	@@userOne = @users.each do |user|
	@@userTwo = @user.each do |user|

	# these variables are available throughout the class to track "matchability"
	@@matchPoints = 0 # if a user get 6(?) match points, they are a good match and goodMatch is changed to true
	@@possibleMatch = false # are the users possible matches
	@@goodMatch = false # is the user a good match for the other user?
	@@geoIdeal = userOne.location + 15 # this is the highest ideal distance (miles) for a user to be from a possible match
	@@geoBound = userOne.location + 50 # this is the highest allowable distance (miles) for a user to be from a possible match
	@@ageHiIdeal = userOne.age + 1 # this is the highest ideal age for a user to go on a date with
	@@ageLoIdeal = userOne.age - 1  # this is the lowest ideal age for a user to go a date with
	@@ageHiBound = userOne.age + 5 # this is the highest allowable age for a user to go on a date with
	@@ageLoBound = userOne.age - 5  # this is the lowest allowable age for a user to go a date with
	@@maxMatchPoints = 6 # the number of points you need to be a "good match"
	def matchFound(points)
		if matchPoints >= 6
			goodMatch = true
			return goodMatch
		end
	end

	# ESSENTIALS: these must match for people to be consider a match at all
	def checkGenderPref(uOne, uTwo) # checks gender preference
		if uOne.gender_id == uTwo.gender_preference_id
			return true
		end
		return false
	end

	def checkMaxAge(uOne, uTwo) # checks age range is close enough
		if ageLoBound <= uTwo.age <= ageHiBound
			return true
		end
		return false
	end

	def isPossible(uOne, uTwo) # is a match possible?
		if((checkGenderPref and checkMaxAge) == true)
			possibleMatch = true
		else
			possibleMatch = false
		end
	end


	# IDEAL: are you an ideal match?
	# Weights several values against each other to determine if you are a good match
	# Weights: 
	# Age: 1 point
	# Geographic location: 2 
	# Favorite team: 3 points 

	def checkIdealAge(uOne, uTwo) # checks to see if users in the ideal range for age
		if (ageLoIdeal <= uTwo.age <= ageHiIdeal)
			matchPoints = matchPoints + 1
		end
	end

	def checkFavoriteTeam(uOne, uTwo) # checks to see if users have the same favorite team 
		if uOne.favorite_team_id == uTwo.favorite_team_id
			matchPoints = matchPoints + 3
		end
	end

	def checkLeastFavoriteTeam(uOne, uTwo) # checks to see if users dislike each others favorite team, or if users dislike the same team
		if uOne.favorite_team_id == uTwo.least_favorite_team_id or uOne.least_favorite_team_id == uTwo.favorite_team_id
			matchPoints = matchPoints - 3
		end 
		if uOne.least_favorite_team_id == uTwo.least_favorite_team_id # "The enemy of my enemy is my future spouse"
			matchPoints = matchPoints + 2
		end
	end

	def checkDistance()
		
	end

	def findMatch(uOne, uTwo)
		if isPossible(u)
	end

end
