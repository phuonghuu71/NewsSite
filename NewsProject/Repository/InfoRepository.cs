using NewsProject.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace NewsProject.Repository
{
    public class InfoRepository
    {
        private NewsSite entity;// = new NewsSite();
        public InfoRepository(NewsSite context)
        {
            this.entity = context;
        }
        
        public WebInfo FindByID(int id = 1)
        {
            WebInfo u = entity.WebInfo.Find(id);
            return u;
        }
       
        public void Update(WebInfo u)
        {
            entity.Entry(u).State = EntityState.Modified;
        }
    }
}