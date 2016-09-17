package nslm2.modules.funnies.guildPKCrossSer.rank
{
   import game.ui.guildPKCrossSer.GPKRank.GPKRankRewardUI;
   import proto.FamilyExpeLastChampionRes;
   import nslm2.modules.funnies.guildPKCrossSer.GPKCModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import com.mz.core.configs.ClientConfig;
   
   public class GPKRankReward extends GPKRankRewardUI
   {
      
      public static const kind_gpk:int = 14;
       
      
      public function GPKRankReward()
      {
         super();
         this.panelBg.txt_titleName.text = LocaleMgr.ins.getStr(9150242);
         this.img_bg.skin = UrlLib.gpkcUrl("img_rankaward_bg.png");
         list_item.itemRender = GPKRRewardRender;
         list_item.spaceY = 0;
         var _loc1_:Array = StcMgr.ins.getVoArrByColumnValue("static_rank","kind",14);
         this.list_item.repeatY = _loc1_.length;
         this.list_item.dataSource = _loc1_;
         this.t0.text = LocaleMgr.ins.getStr(40710403);
         this.t1.text = LocaleMgr.ins.getStr(50700025);
         this.t2.text = LocaleMgr.ins.getStr(50700026);
         this.txt1.text = LocaleMgr.ins.getStr(50700023);
         this.txt2.text = LocaleMgr.ins.getStr(50700024);
         if(ClientConfig.isRuLang())
         {
            this.txt2.width = 400;
            this.txt2.x = 165;
         }
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         var _loc2_:FamilyExpeLastChampionRes = param1 as FamilyExpeLastChampionRes;
         if(_loc2_ == null)
         {
            this.txt0.text = "";
            GPKCModel.ins.reqLastChampion(setLastChampion);
            return;
         }
         var _loc3_:String = LocaleMgr.ins.getStr(41700007) + (_loc2_.myRank <= 0?LocaleMgr.ins.getStr(12300):_loc2_.myRank) + "\n" + LocaleMgr.ins.getStr(40700033) + "：" + _loc2_.myFamilyRank;
         this.txt0.text = _loc3_;
      }
      
      private function setLastChampion(param1:FamilyExpeLastChampionRes) : void
      {
         var _loc2_:* = null;
         if(param1)
         {
            _loc2_ = LocaleMgr.ins.getStr(41700007) + (param1.myRank <= 0?LocaleMgr.ins.getStr(12300):param1.myRank) + "\n" + LocaleMgr.ins.getStr(40700033) + "：" + param1.myFamilyRank;
            this.txt0.text = _loc2_;
         }
      }
   }
}
