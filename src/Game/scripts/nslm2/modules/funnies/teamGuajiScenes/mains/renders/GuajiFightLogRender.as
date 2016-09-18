package nslm2.modules.funnies.teamGuajiScenes.mains.renders
{
   import game.ui.teamGuajiScenes.mains.GuajiFightLogRenderUI;
   import proto.GuajiReport;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.battles.reportPlayer.BattleReportParamVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.skins.ColorLib;
   import com.mz.core.utils.TextFieldUtil;
   
   public class GuajiFightLogRender extends GuajiFightLogRenderUI
   {
       
      
      private var data:GuajiReport;
      
      public function GuajiFightLogRender()
      {
         super();
         this.txt_playback.text = LocaleMgr.ins.getStr(50200024);
         this.txt_playback.buttonMode = true;
         this.txt_playback.mouseChildren = false;
         this.txt_playback.addEventListener("click",playBack_onClick);
      }
      
      protected function playBack_onClick(param1:MouseEvent) : void
      {
         ModuleMgr.ins.showModule(40201,BattleReportParamVo.createIds([data.reportId]));
      }
      
      override public function set dataSource(param1:Object) : void
      {
         var _loc6_:int = 0;
         var _loc5_:* = null;
         var _loc2_:* = null;
         var _loc4_:* = 0;
         var _loc3_:* = null;
         data = param1 as GuajiReport;
         if(data)
         {
            if(data.result == 1)
            {
               _loc6_ = 41210123;
            }
            else
            {
               _loc6_ = 41210615;
            }
            _loc5_ = StcMgr.ins.getNpcVo(data.npcId);
            _loc2_ = LocaleMgr.ins.getStr(_loc5_.name);
            _loc4_ = uint(ColorLib.qualityColor(_loc5_.quality));
            _loc3_ = TextFieldUtil.htmlText2(_loc2_,_loc4_);
            txt_content.text = LocaleMgr.ins.getStr(_loc6_,[_loc3_,data.turnNum,data.fightCd]);
         }
      }
   }
}
