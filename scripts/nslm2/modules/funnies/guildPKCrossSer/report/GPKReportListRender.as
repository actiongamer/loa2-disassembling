package nslm2.modules.funnies.guildPKCrossSer.report
{
   import game.ui.funnyEvents.FunnyEventRenderUI;
   import flash.events.MouseEvent;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import proto.FamilyExpeBattleReportInfo;
   import morn.core.utils.StringUtils;
   import nslm2.utils.TimeUtils;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   
   public class GPKReportListRender extends FunnyEventRenderUI
   {
       
      
      public function GPKReportListRender()
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
      
      private function get da() : FamilyExpeBattleReportInfo
      {
         return this.dataSource as FamilyExpeBattleReportInfo;
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
         var _loc3_:String = "<font color=\'#49a7ff\'>" + da.atkName + "</font>";
         var _loc2_:String = "<font color=\'#49a7ff\'>" + getDistStr(da.defOpName,da.defDistId,da.defName,null) + "</font>";
         var _loc5_:String = !!da.isAtkWin?LocaleMgr.ins.getStr(50600021):LocaleMgr.ins.getStr(50600022);
         var _loc4_:String = TextFieldUtil.htmlText2(da.damage + "%",11137387);
         this.txt_content.text = LocaleMgr.ins.getStr(30610235,[_loc3_,_loc2_,_loc5_,_loc4_,TextFieldUtil.htmlText2(da.con,11137387),TextFieldUtil.htmlText2(da.coin,11137387)]);
      }
   }
}
