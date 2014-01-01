using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication3.Application_Code
{
    public class Datamanager
    {
        public ModelDataContext modx { get; set; }
        public UvaRequest uvareq { get; set; }
        public Datamanager()
        {
            modx = new ModelDataContext();
            uvareq = new UvaRequest();
        }

        public Usuario AddNewUsuario()
        {
            return null;
        }

        public aspnet_User GetUserByUname(string uname)
        {
            return modx.aspnet_Users.Where(x => x.UserName == uname).FirstOrDefault();
        }

        public void UpdateRankingForSpecificUser(aspnet_User user, int uid)
        {
            
            int NoAccepted = uvareq.GetUvaUserSolvedProblems(uid);
            Rank userRank;

            try
            {
                if ( user.Rank != null)
                {
                    user.Rank.Solved = NoAccepted;
                }
                else
                {

                    userRank = new Rank()
                    {
                        IdUser = user.UserId,
                        UvaUserName = user.UserName,
                        Solved = NoAccepted
                    };


                    modx.Ranks.InsertOnSubmit(userRank);

                }
                
                modx.SubmitChanges();
            }
            catch (NullReferenceException ex)
            {

            }
            //test if null then same solved
            
        }

        public void UpdateSolutionsForSpecificUser(aspnet_User user, int uid)
        {
            foreach (var problem in modx.Problems)
            {
                var exists = user.Usuario.SolutionsPerUsers.Where(x => x.Problemid == problem.UvaProblemId).FirstOrDefault();
                if (exists == null)
                {
                    Boolean isSolved = uvareq.ProblemSolvedByUser(uid, problem.UvaProblemId);
                    if (isSolved)
                    {
                        SolutionsPerUser sol = new SolutionsPerUser()
                        {
                            Problemid = problem.UvaProblemId,
                            Uid = uid
                        };
                        modx.SolutionsPerUsers.InsertOnSubmit(sol);
                    }
                }
                else
                {
                    
                }
   
            }

            modx.SubmitChanges();

            
        }

    }
}