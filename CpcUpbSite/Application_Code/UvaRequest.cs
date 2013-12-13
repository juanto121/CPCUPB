using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using RestSharp;
using WebApplication3.Application_Code;

namespace WebApplication3.Application_Code
{
    public class UvaRequest
    {
        public RestClient restClient { get; set; }

        public UvaRequest()
        {
            restClient = new RestClient("http://uhunt.felix-halim.net/api");
        }

        public string GetUvaUserIdByUsername(string username)
        {

            var request = new RestRequest("uname2uid/{uname}", Method.GET);
            request.AddUrlSegment("uname", username );
            var response = restClient.Execute(request);
            return response.Content;
        }

        public int GetUvaUserSolvedProblems(int uvaid)
        {
            var request = new RestRequest("ranklist/{user-id}/0/0", Method.GET);
            request.AddUrlSegment("user-id", uvaid+"");
            request.RequestFormat = DataFormat.Json;
            var response = restClient.Execute<List<UvaRank>>(request);
            try
            {
                    return response.Data.FirstOrDefault().ac;

            }
            catch (ArgumentNullException e)
            {
                return 0;
            }
        }

        public Boolean ProblemSolvedByUser(int userId, int pId)
        {
            var request = new RestRequest("solved-bits/{user-ids-csv}", Method.GET);
            request.AddUrlSegment("user-ids-csv", userId + "");
            request.RequestFormat = DataFormat.Json;
            var responsed =restClient.Execute<List<UvaSolvedBit>>(request);
            UvaSolvedBit response = (UvaSolvedBit)(responsed.Data.FirstOrDefault());
            int position =(int) Math.Floor((double)(pId / 32));
            int bitPos = pId - (position*32);
            if (position <= response.solved.Count()-1)
            {
                long bit = ((UvaSolvedBit)response).solved.ElementAt(position);
                if (((int)bit & (int)Math.Pow(2, bitPos)) != 0)
                {

                    return true;
                }
                else
                {
                    return false;
                }
            }
            return false;
        }

    }
}