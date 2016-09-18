package nslm2.modules.funnies.families.familyBosses.view
{
   import game.ui.familyBosses.FamilyBossSetTimePanelUI;
   import nslm2.modules.funnies.families.familyBosses.model.FamilyBossModel;
   import nslm2.modules.foundations.guildModule.model.GuildModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.TimeUtils;
   import nslm2.mgrs.stcMgrs.consts.DefindConsts;
   import org.manager.DateUtils;
   import morn.core.components.Button;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.funnies.families.familyBosses.service.FamilyBossServiceHandler;
   import morn.customs.expands.MornExpandUtil;
   
   public class FamilyBossSetTimeModule extends FamilyBossSetTimePanelUI
   {
       
      
      private var model:FamilyBossModel;
      
      private var selectedTime:int;
      
      public function FamilyBossSetTimeModule()
      {
         model = FamilyBossModel.ins;
         super();
         moduleFadeInType = 0;
         MornExpandUtil.addHandlerForBtnAll(this,btnClickHanlder);
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:* = null;
         var _loc7_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:* = null;
         list_timetable.mouseEvent = GuildModel.ins.isPresident() || GuildModel.ins.isVP();
         if(!model.selectedNextActTime)
         {
            if(GuildModel.ins.isPresident() || GuildModel.ins.isVP())
            {
               txt_info.text = LocaleMgr.ins.getStr(40740031);
            }
            else
            {
               txt_info.text = LocaleMgr.ins.getStr(40740033);
            }
         }
         else
         {
            txt_info.text = LocaleMgr.ins.getStr(40740035,[TimeUtils.getFullTimeStrCN(model.nextActivityStartTime,false,false)]);
            list_timetable.mouseEvent = false;
         }
         var _loc8_:Array = String(DefindConsts.gonghuiboss_select_time).split("|");
         var _loc5_:Array = [];
         _loc7_ = 0;
         while(_loc7_ < 8)
         {
            _loc3_ = new DateUtils();
            _loc3_.time = model.nextRoundStartTime * 1000;
            if(_loc7_ < 4)
            {
               _loc3_.hours = _loc8_[_loc7_];
            }
            else
            {
               _loc3_.date = _loc3_.date + 1;
               _loc3_.hours = _loc8_[_loc7_ - 4];
            }
            _loc5_.push(_loc3_);
            _loc7_++;
         }
         list_timetable.dataSource = _loc5_;
         var _loc6_:* = -1;
         if(model.selectedNextActTime)
         {
            _loc4_ = _loc5_.length;
            _loc7_ = 0;
            while(_loc7_ < _loc4_)
            {
               _loc2_ = _loc5_[_loc7_];
               if(_loc2_.time / 1000 == model.nextActivityStartTime)
               {
                  _loc6_ = _loc7_;
                  break;
               }
               _loc7_++;
            }
            list_timetable.selectedIndex = _loc6_;
         }
         super.preShow(null);
      }
      
      private function btnClickHanlder(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(btn_confirm !== _loc2_)
         {
            if(btn_cancel === _loc2_)
            {
               super.btnCloseHandler(null);
            }
         }
         else if(GuildModel.ins.isPresident() || GuildModel.ins.isVP())
         {
            if(!list_timetable.selectedItem)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(40740264));
            }
            else if(!model.selectedNextActTime)
            {
               selectedTime = (list_timetable.selectedItem as DateUtils).time / 1000;
               FamilyBossServiceHandler.ins.setNextTime(selectedTime,setTimeSuccessHandler);
            }
            else
            {
               super.btnCloseHandler(null);
            }
         }
         else
         {
            super.btnCloseHandler(null);
         }
      }
      
      private function setTimeSuccessHandler(param1:Object) : void
      {
         AlertUtil.float(LocaleMgr.ins.getStr(40740032,[TimeUtils.getFullTimeStrCN(selectedTime,false,false)]));
         model.nextActivityStartTime = selectedTime;
         model.selectedNextActTime = true;
         txt_info.text = LocaleMgr.ins.getStr(40740035,[TimeUtils.getFullTimeStrCN(selectedTime,false,false)]);
      }
   }
}
