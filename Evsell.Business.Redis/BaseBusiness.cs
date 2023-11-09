using Evsell.Business.Common.Response;
using Newtonsoft.Json;
using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using JsonSerializer = System.Text.Json.JsonSerializer;

namespace Evsell.Business.Redis
{
    public class BaseBusiness
    {
        private ConnectionMultiplexer redis;
        private IDatabase db;

        public static void SetData<T>(string key, T data)
        {
            // Redis bağlantısını oluştur
            using (ConnectionMultiplexer redis = ConnectionMultiplexer.Connect("localhost:6379"))
            {
                IDatabase db = redis.GetDatabase();

                // Nesneyi JSON'a dönüştür
                string jsonData = JsonSerializer.Serialize(data, new JsonSerializerOptions { IgnoreNullValues = true });

                // Veriyi Redis'e yaz
                db.StringSet(key, jsonData);
            }
        }

        public static T GetData<T>(string key)
        {
            using (var redis = ConnectionMultiplexer.Connect("localhost:6379"))
            {
                try
                {
                    IDatabase db = redis.GetDatabase();
                    var res = db.StringGet(key);
                    redis.Close();
                    if (res.IsNull)
                        return default(T);
                    else
                        return JsonConvert.DeserializeObject<T>(res);
                }
                catch
                {
                    return default(T);
                }

            }
        }
        public static void DeleteData(string key)
        {
            using (var redis = ConnectionMultiplexer.Connect("localhost:6379"))
            {
                try
                {
                    IDatabase db = redis.GetDatabase();
                    db.KeyDelete(key);
                    redis.Close();
                }
                catch
                {
                    
                }

            }
        }
    }
}
