package nslm2.modules.battles.battle
{
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import com.mz.core.configs.ClientConfig;
   import nslm2.common.model.PlayerModel;
   import nslm2.utils.TimeUtils;
   import org.manager.DateUtils;
   import flash.net.URLVariables;
   import com.mz.core.logging.Log;
   
   public class BattleLogger
   {
       
      
      private var urlLoader:URLLoader;
      
      private var urlRequest:URLRequest;
      
      public function BattleLogger()
      {
         super();
      }
      
      public function send(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         try
         {
            if(urlLoader == null)
            {
               this.urlLoader = new URLLoader();
               this.urlRequest = new URLRequest(ClientConfig.battleReportUrl.replace("btl","client"));
               this.urlRequest.method = "POST";
               this.urlRequest.contentType = "application/x-www-form-urlencoded";
            }
            _loc3_ = "Battle result no equal:[client ver]792|" + PlayerModel.ins.playerInfo.name + "|" + PlayerModel.ins.playerInfo.id.toString() + "|" + TimeUtils.getFullTimeStrDate(new DateUtils());
            param1 = _loc3_ + "|" + param1 + "\n";
            _loc2_ = new URLVariables();
            _loc2_.data = param1;
            this.urlRequest.data = _loc2_;
            urlLoader.load(urlRequest);
            return;
         }
         catch(err:Error)
         {
            Log.error(this,err,err.getStackTrace());
            return;
         }
      }
   }
}
