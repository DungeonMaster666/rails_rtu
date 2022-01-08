import scrapy
from scrapy.item import Item, Field
import psycopg2


class Product(Item):
    name = Field()
    image = Field()
    price = Field()
    link = Field()

class BarboraSpider(scrapy.Spider):
    name = "barbora"
    allowed_domains = ["barbora.lv"]
    products = []
    MAX_PRODUCT_COUNT = 5

    def __init__(self, _product_name="", _user_id="", *args, **kwargs):
        super(BarboraSpider, self).__init__(*args, **kwargs)
        self.export_file_name = "export_{}_{}.txt".format(self.name, _product_name)
        self.product_to_find = _product_name
        if len(_product_name.split()) > 1:
            _product_name = _product_name.replace(" ", "%20")
        self.start_urls = ["https://barbora.lv/meklet?order=priceAsc&q={}".format(_product_name)]
        self.user_id = _user_id

# cd prodTest
# scrapy crawl barbora -a _product_name="<NAME>"
# C:\Users\mkorcevskis\Desktop\RTU\DOP719\webCrawlerTest\prodTest> scrapy crawl barbora -a _product_name="āboli"

    def parse(self, response):
        #conn = psycopg2.connect("dbname=rtu_rails user=janis password=eiduks")
        conn = psycopg2.connect("dbname=d8qffhfgaa6j7k user=lmccvoachcolkw password=5d996fba5503e575178241032d4034b1518e53ea70012e3e5e6754882fbadcc1 host=ec2-54-195-76-73.eu-west-1.compute.amazonaws.com")
        cursor = conn.cursor()
        for i, iter_product in enumerate(response.css('div.b-product-wrap-img')):
            i = i + 1
            product = Product()
            product['name'] = iter_product.css('span[itemprop="name"]::text').get()
            product['image'] = iter_product.css('img[itemprop="image"]::attr(src)').get()
            euros = iter_product.css('span.b-product-price-current-number::attr(content)').get()
            product_price = euros if euros else "NaN"
            product['price'] = product_price
            product['link'] = "https://" + self.allowed_domains[0] + iter_product.css('a.b-product-title::attr(href)').get()
            self.products.append(product)
                #
                #json.dump({
                 #   'num': i,
                  #  'name': iter_product.css('span[itemprop="name"]::text').get(),
                   # 'image': iter_product.css('img[itemprop="image"]::attr(src)').get(),
                    #'price': product_price,
                    #'link': "https://" + self.allowed_domains[0] + iter_product.css('a.b-product-title::attr(href)').get()
                #}, f, indent=4)
                #f.write("\n")
                #
            #if i == self.MAX_PRODUCT_COUNT:
             #   break
        # file has been closed
        #print("-------------------------")
        #print("BEFORE FILTERING = " + str(len(self.products)))
        self.products = [i for i in self.products if any(item in [j.upper() for j in self.product_to_find.split()] for item in [k.upper() for k in i['name'].split()]) and not i['price'].isalpha()]
        if len(self.products) > 0:
            #print("AFTER FILTERING = " + str(len(self.products)))
            #_summa = 0
            #for i in self.products:
            #    _summa += float(i['price'])
            #    print(i)
            #_average = _summa / len(self.products)
            #print("AVERAGE OF {} = {:.2f} EUR".format(self.product_to_find, _average))
            #print("MEDIAN OF {} = {} EUR".format(self.product_to_find, self.products[round(len(self.products) / 2)]['price']))
            values = (self.products[round(len(self.products) / 2)]['price'], self.products[round(len(self.products) / 2)]['link'], self.products[round(len(self.products) / 2)]['image'])

            query = f"UPDATE edienkartes SET cena = %s, shopnos = %s, linktophoto = %s WHERE prodnos = '{self.product_to_find}' AND user_id = '{self.user_id}';"
            cursor.execute(query, values)
            conn.commit()
            conn.close()
            print("")
        else:
            print("No such product")
            conn.close()
