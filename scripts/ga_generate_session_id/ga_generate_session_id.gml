{
	if (!ga_enabled()){return;}
    result = "";
    repeat(8)
    {
        result += string(choose(0,1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f"));
    }
    result += "-"   
    repeat(4)
    {
        result += string(choose(0,1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f"));
    }
    result += "-"    
    repeat(4)
    {
        result += string(choose(0,1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f"));
    }
    result += "-"
    repeat(4)
    {
        result += string(choose(0,1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f"));
    }
    result += "-"    
    repeat(12)
    {
        result += string(choose(0,1,2,3,4,5,6,7,8,9,"a","b","c","d","e","f"));
    }
    
    return result;
}
