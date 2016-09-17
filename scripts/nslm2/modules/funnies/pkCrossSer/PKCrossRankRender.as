package nslm2.modules.funnies.pkCrossSer
{
   import game.ui.pkCrossSer.PKCrossRankRenderUI;
   import proto.CrossArenaRankInfo;
   import nslm2.common.vo.PlayerVo;
   import com.mz.core.configs.ClientConfig;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.funnies.newYears.olmpic2016.OlmpicSelCountryModel;
   import flash.events.Event;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcCountryIconVo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   
   public class PKCrossRankRender extends PKCrossRankRenderUI
   {
      
      public static var type:int = 0;
       
      
      private var info:CrossArenaRankInfo;
      
      private var playvo:PlayerVo;
      
      public function PKCrossRankRender()
      {
         super();
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc2_:* = null;
         if(!param1)
         {
            return;
         }
         info = param1 as CrossArenaRankInfo;
         playvo = PKCrossConst.RankInfoToPlayerVo(info.info);
         playvo.militaryRank = 0;
         if(info)
         {
            if(ClientConfig.isChineseLang())
            {
               _loc2_ = int(Uint64Util.toNumber(info.info.ability) / 10000) + "W";
            }
            else
            {
               _loc2_ = int(Uint64Util.toNumber(info.info.ability) / 1000) + "K";
            }
            if(type == 2)
            {
               playvo.name = PlayerModel.ins.getFullNameWithDistName(info.info,false);
               this.txt_rank.text = info.rank + "";
               this.txt_rank.text = info.rank + "";
               this.txt_ser.text = "";
               this.txt_jifen.text = _loc2_;
            }
            else if(type == 3)
            {
               this.txt_rank.text = info.score + "";
               this.txt_jifen.text = info.rank + "";
               this.txt_ser.text = _loc2_;
            }
            else
            {
               playvo.name = PlayerModel.ins.getFullNameWithDistName(info.info,false);
               this.txt_jifen.text = info.score + "";
               this.txt_jifen.text = info.score + "";
               this.txt_rank.text = info.rank + "";
               this.txt_ser.text = "";
            }
         }
         updateCountryByInfo();
         .super.dataSource = playvo;
      }
      
      private function updateCountryByInfo() : void
      {
         if(OlmpicSelCountryModel.ins.isOpen())
         {
            this.txt_name.isHtml = true;
            if(Uint64Util.equal(info.info.id,PlayerModel.ins.playerInfo.id))
            {
               OlmpicSelCountryModel.ins.addEventListener("myCountryChange",onMyCountryChange);
            }
            else
            {
               OlmpicSelCountryModel.ins.removeEventListener("myCountryChange",onMyCountryChange);
            }
            vCountryName();
         }
      }
      
      protected function onMyCountryChange(param1:Event) : void
      {
         vCountryName();
         validateTxtName();
      }
      
      private function vCountryName() : void
      {
         var _loc1_:* = null;
         if(playvo)
         {
            if(info.country == 0)
            {
               playvo.name = info.info.name;
            }
            else
            {
               _loc1_ = StcMgr.ins.getCountryIconVo(info.country);
               this.txt_name.isHtml = true;
               playvo.name = "@{icon:" + UrlLib.olmpicCountryFlagUrl(_loc1_.icon) + ":flagScale}" + info.info.name;
            }
         }
      }
      
      override public function dispose() : void
      {
         if(OlmpicSelCountryModel.ins.isOpen())
         {
            OlmpicSelCountryModel.ins.removeEventListener("myCountryChange",onMyCountryChange);
         }
      }
   }
}
