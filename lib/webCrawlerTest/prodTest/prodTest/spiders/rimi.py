import scrapy
import json
from scrapy.item import Item, Field


class Product(Item):
    name = Field()
    image = Field()
    price = Field()
    link = Field()

class RimiSpider(scrapy.Spider):
    name = "rimi"
    allowed_domains = ["rimi.lv"]
    products = []
    MAX_PRODUCT_COUNT = 5

    def __init__(self, _product_name="", *args, **kwargs):
        super(RimiSpider, self).__init__(*args, **kwargs)
        self.start_urls = ["https://www.rimi.lv/e-veikals/lv/meklesana?page=1&pageSize=80&query={}%3Aprice-asc%3AassortmentStatus%3AinAssortment".format(_product_name)]
        self.export_file_name = "export_{}_{}.txt".format(self.name, _product_name)
        self.product_to_find = _product_name

# cd prodTest
# scrapy crawl rimi -a _product_name="<NAME>"
# C:\Users\mkorcevskis\Desktop\RTU\DOP719\webCrawlerTest\prodTest> scrapy crawl rimi -a _product_name="āboli"

    def parse(self, response):
        with open(self.export_file_name, "w") as f:
            for i, iter_product in enumerate(response.css('li.product-grid__item')):
                i = i + 1
                product = Product()
                product['name'] = iter_product.css('p.card__name::text').get()
                product['image'] = iter_product.css('div.card__image-wrapper>div>img::attr(src)').get()
                euros = iter_product.css('div.card__price>span::text').get()
                cents = iter_product.css('div.card__price>div>sup::text').get()
                product_price = euros + "." + cents if euros and cents else "NaN"
                product['price'] = product_price
                product['link'] = "https://www." + self.allowed_domains[0] + iter_product.css('a.card__url::attr(href)').get()
                self.products.append(product)
                #
                json.dump({
                    'num': i,
                    'name': iter_product.css('p.card__name::text').get(),
                    'image': iter_product.css('div.card__image-wrapper>div>img::attr(src)').get(),
                    'price': product_price,
                    'link': "https://www." + self.allowed_domains[0] + iter_product.css('a.card__url::attr(href)').get()
                }, f, indent=4)
                f.write("\n")
                #
                # if i == self.MAX_PRODUCT_COUNT:
                #     break
        # file has been closed
        print("-------------------------")
        print("BEFORE FILTERING = " + str(len(self.products)))
        self.products = [i for i in self.products if self.product_to_find.upper() in [j.upper() for j in i['name'].split()] and not i['price'].isalpha()]
        if len(self.products) > 0:
            print("AFTER FILTERING = " + str(len(self.products)))
            _summa = 0
            for i in self.products:
                _summa += float(i['price'])
                print(i)
            _average = _summa / len(self.products)
            print("AVERAGE OF {} = {:.2f} EUR".format(self.product_to_find, _average))
            print("MEDIAN OF {} = {} EUR".format(self.product_to_find, self.products[round(len(self.products) / 2)]['price']))
        else:
            print(self.products)
            print("No such product found!")
        print("-------------------------")

# def parse(self, response):
#     with open(self.export_file_name, "w") as f:
#         for i, iter_product in enumerate(response.css('div.b-product-wrap-img')):
#             json.dump({
#                 'num': i + 1,
#                 'name': iter_product.css('span[itemprop="name"]::text').get(),
#                 'image': iter_product.css('img[itemprop="image"]::attr(src)').get(),
#                 'price': iter_product.css('span.b-product-price-current-number::attr(content)').get(),
#                 'link': self.allowed_domains[0] + iter_product.css('a.b-product-title::attr(href)').get()
#             }, f, indent=4)
#             f.write("\n")
#             if i == self.MAX_PRODUCT_COUNT - 1:
#                 quit()

# def parse(self, response):
#     for product in response.css('div.b-product-wrap-img'):
#         yield {
#             'name': product.css('span[itemprop="name"]::text').get(),
#             'image': product.css('img[itemprop="image"]::attr(src)').get(),
#             'price': product.css('span.b-product-price-current-number::attr(content)').get(),
#             'link': self.allowed_domains[0] + product.css('a.b-product-title::attr(href)').get()
#         }
