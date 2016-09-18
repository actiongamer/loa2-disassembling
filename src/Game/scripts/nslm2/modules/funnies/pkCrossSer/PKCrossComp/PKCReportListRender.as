package nslm2.modules.funnies.pkCrossSer.PKCrossComp
{
   import game.ui.funnyEvents.FunnyEventRenderUI;
   import flash.events.MouseEvent;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.CrossArenaReportInfo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.TimeUtils;
   import nslm2.utils.Uint64Util;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   
   public class PKCReportListRender extends FunnyEventRenderUI
   {
       
      
      public function PKCReportListRender()
      {
         super();
         this.txt_new.visible = false;
         this.txt_playback.visible = true;
         this.txt_getBack.visible = false;
         this.txt_playback.addEventListener("click",playBack_onClick);
         this.txt_playback.buttonMode = true;
         this.txt_playback.mouseChildren = false;
      }
      
      private function playBack_onClick(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(da)
         {
            _loc2_ = BattleReportParamVo.createIds([this.da.reportId]);
            _loc2_.type = 1;
            ModuleMgr.ins.showModule(40201,_loc2_);
         }
      }
      
      private function get da() : CrossArenaReportInfo
      {
         return this.dataSource as CrossArenaReportInfo;
      }
      
      private function getDistStr(param1:String, param2:uint, param3:String, param4:String) : String
      {
         var _loc5_:* = null;
         if(!StringUtils.isNull(param4))
         {
            _loc5_ = param4;
         }
         else
         {
            _loc5_ = "S" + param2 % 10000;
         }
         return [param1,_loc5_,param3].join(".");
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 == null)
         {
            return;
         }
         this.txt_time.text = "[ " + TimeUtils.getFullTimeStr(da.stamp) + " ]";
         var _loc2_:String = "";
         if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,da.atkId))
         {
            _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600019);
         }
         else
         {
            _loc2_ = _loc2_ + ("<font color=\'#49a7ff\'>" + getDistStr(da.atkOpName,da.atkDist,da.atkName,da.atkDistName) + "</font>");
         }
         _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600020);
         var _loc3_:Boolean = false;
         if(Uint64Util.equal(PlayerModel.ins.playerInfo.id,da.defId))
         {
            _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600019);
            _loc3_ = true;
         }
         else
         {
            _loc2_ = _loc2_ + ("<font color=\'#49a7ff\'>" + getDistStr(da.defOpName,da.defDist,da.defName,da.defDistName) + "</font>");
         }
         if(da.isAtkWin)
         {
            _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600021);
         }
         else
         {
            _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600022);
         }
         if(PKCrossReportModule.type == 1)
         {
            _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600023,[da.addScore]);
         }
         else if(da.isRankChange)
         {
            if(da.isAtkWin)
            {
               if(PKCrossReportModule.type == 2 && _loc3_)
               {
                  _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600025,[da.defRank]);
               }
               else
               {
                  _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600024,[da.atkRank]);
               }
            }
            else
            {
               _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600025,[da.atkRank]);
            }
         }
         else
         {
            _loc2_ = _loc2_ + LocaleMgr.ins.getStr(50600026);
         }
         this.txt_content.text = _loc2_;
      }
   }
}
