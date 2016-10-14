
import feedparser
data= feedparser.parse("http://www.metroalerts.info/rss.aspx?rs")
lines= ("ORANGE", "GREEN", "YELLOW", "BLUE", "SILVER", "RED")

def get_alerts(color):
    color=color.upper()
    if color in lines: pass
    else: return "Not a metro line. Try again."

    info=list()
    for post in data.entries:
        alert=post.title + ":"+ " "+ post.description
        alert=alert.encode("utf-8")
        if color == post.title.encode("utf-8"):
            info.append(alert)
            

    if not info:
        return "This line does not have any delays"
    if info:
        return info


#make functions

if __name__ == '__main__':
    print get_alerts('green')
    print get_alerts('red')
    print get_alerts('oranGE')
    