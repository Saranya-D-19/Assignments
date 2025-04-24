using System.Collections.Generic;
using TechShop.Entity;

namespace TechShop.DAO
{
    public interface IProductDAO
    {
        bool AddProduct(Product product);
        bool UpdateProduct(Product product);
        bool DeleteProduct(int productId);
        Product? GetProductById(int productId);
        List<Product> GetAllProducts();
    }
}
