package nslm2.modules.foundations.mainToolBar
{
   import game.ui.mainToolBar.BottomIconRenderBigUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.uiEffects.RoleGrowFilterMed;
   import flash.events.MouseEvent;
   import nslm2.utils.ServerTimer;
   import org.manager.DateUtils;
   import com.mz.core.utils.LocalData;
   import nslm2.common.ui.components.comps2d.others.TaskAlertRender;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.model.PlayerModel;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import morn.customs.FilterLib;
   
   public class BottomIconRenderBig extends BottomIconRenderBigUI implements IObserver
   {
       
      
      private var rollMed:RoleGrowFilterMed;
      
      private var _taskAlertRender:TaskAlertRender;
      
      public function BottomIconRenderBig()
      {
         super();
         this.buttonMode = true;
         rollMed = new RoleGrowFilterMed(this,null);
         this.parts.push(new RoleGrowFilterMed(this,null));
         this.addEventListener("click",btnShop_click);
      }
      
      private function btnShop_click(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         if(_taskAlertRender)
         {
            _loc2_ = ServerTimer.ins.date;
            _loc2_.hours = 5;
            LocalData.insCurPlayer.save("qqMallShowStamp",_loc2_.time / 1000);
            _taskAlertRender.dispose();
            _taskAlertRender = null;
         }
      }
      
      public function get moduleId() : int
      {
         return this.dataSource as int;
      }
      
      public function set moduleId(param1:int) : void
      {
         this.dataSource = param1;
         refresh();
      }
      
      private function refresh() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = false;
         if(this.dataSource == 11200)
         {
            this.img_bg.y = 72;
            this.txt_names.visible = false;
            _loc1_ = LocalData.insCurPlayer.load("qqMallShowStamp",0);
            _loc2_ = ServerTimer.ins.second - _loc1_ >= 86400;
            if(EnvConfig.ins.showQQModule && _loc2_ && PlayerModel.ins.level >= 10)
            {
               if(_taskAlertRender == null)
               {
                  _taskAlertRender = new TaskAlertRender();
                  _taskAlertRender.txt_content.text = LocaleMgr.ins.getStr(41300830);
                  _taskAlertRender.x = 30;
                  _taskAlertRender.img_bg.height = _taskAlertRender.txt_content.textHeight + _taskAlertRender.txt_content.y * 2;
               }
               this.addChild(_taskAlertRender);
            }
            else if(_taskAlertRender)
            {
               _taskAlertRender.dispose();
               _taskAlertRender = null;
            }
         }
         else if(_taskAlertRender)
         {
            _taskAlertRender.dispose();
            _taskAlertRender = null;
         }
      }
      
      public function show() : void
      {
      }
      
      public function hide() : void
      {
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(this.moduleId > 0)
         {
            ObserverMgr.ins.regObserver(this);
            this.toolTip = LocaleMgr.ins.getStr(9000000 + this.moduleId);
            this.img_bg.skin = UrlLib.mainToolBarIcon(this.moduleId);
            this.txt_names.text = LocaleMgr.ins.getStr(9000000 + this.moduleId);
            rollMed.glowFilter = FilterLib.BORDER_YELLOW;
         }
         else
         {
            this.toolTip = null;
            rollMed.glowFilter = null;
            ObserverMgr.ins.unregObserver(this);
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["PLAYER_LEVEL_UP"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("PLAYER_LEVEL_UP" === _loc3_)
         {
            refresh();
         }
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
