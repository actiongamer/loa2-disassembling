package nslm2.modules.scenes.mainCitys
{
   import game.ui.resourceDg.ResCellUI;
   import flash.events.MouseEvent;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHeropracticeTypeVo;
   import proto.HeroPracticeTypeNodeInfo;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.model.PlayerModel;
   import morn.customs.FilterLib;
   import nslm2.modules.foundations.activities.model.ActivityModel;
   import nslm2.common.ui.components.comps2d.others.ActivityDoubleTip;
   
   public class ResCell extends ResCellUI
   {
       
      
      private var _stcVo:StcHeropracticeTypeVo;
      
      public function ResCell()
      {
         super();
      }
      
      protected function onClick(param1:MouseEvent) : void
      {
         ObserverMgr.ins.sendNotice("RES_DG_SELECT_ONE_RES",_stcVo);
      }
      
      override public function set dataSource(param1:Object) : void
      {
      }
      
      private function reset() : void
      {
         img_icon.filters = [];
         icon_face.filters = [];
      }
      
      public function init(param1:StcHeropracticeTypeVo, param2:HeroPracticeTypeNodeInfo) : void
      {
         var _loc4_:* = null;
         reset();
         this._stcVo = param1;
         this.icon_face.url = UrlLib.resIcon(param1.icon + "");
         this.img_icon.url = UrlLib.resIcon("icon" + param1.icon);
         this.hitArea = this.hot_area;
         this.hot_area.mouseEnabled = false;
         this.hot_area.visible = false;
         this.img_hl.visible = false;
         if(ClientConfig.isRuLang())
         {
            this.txt_res.size = 12;
            this.txt_res.y = this.txt_res.y + 2;
         }
         this.txt_res.text = LocaleMgr.ins.getStr(param1.name);
         var _loc3_:WealthVo = WealthUtil.costStrToArr(param1.desc)[0];
         img_icon.buttonMode = true;
         img_icon.toolTip = WealthUtil.tooltip(_loc3_);
         if(PlayerModel.ins.level < param1.openlevel)
         {
            txt_next.text = LocaleMgr.ins.getStr(41400002,[param1.openlevel]);
            icon_face.filters = FilterLib.ins.getFilterArr(402);
            img_icon.filters = FilterLib.ins.getFilterArr(402);
            icon_bei.visible = false;
            txt_state.visible = false;
            this.times.visible = false;
            txt_next.visible = true;
            this.redpoint.visible = false;
            this.img_chain.visible = true;
            return;
         }
         if(param2 == null)
         {
            if(param1.opentime == 1)
            {
               this.txt_next.text = LocaleMgr.ins.getStr(41400003);
            }
            else if(param1.opentime == 2)
            {
               this.txt_next.text = LocaleMgr.ins.getStr(41400004);
            }
            icon_face.filters = FilterLib.ins.getFilterArr(402);
            img_icon.filters = FilterLib.ins.getFilterArr(402);
            this.img_chain.visible = true;
            txt_state.visible = false;
            this.times.visible = false;
            txt_next.visible = true;
            this.redpoint.visible = false;
            icon_bei.visible = false;
            return;
         }
         if(param2.state == 2)
         {
            this.txt_next.text = LocaleMgr.ins.getStr(41400001);
            txt_state.visible = false;
            this.times.visible = false;
            txt_next.visible = true;
            icon_bei.visible = false;
            this.img_chain.visible = false;
            if(param2.challengeTimes > 0)
            {
               this.redpoint.visible = true;
               this.redpoint.txt_count.text = param2.challengeTimes + "";
            }
            else
            {
               this.redpoint.visible = false;
            }
            this.addEventListener("click",onClick);
            this.buttonMode = true;
         }
         if(param2.state == 1)
         {
            this.txt_state.text = LocaleMgr.ins.getStr(41400000);
            this.times.value = param2.challengeTimes;
            this.times.visible = true;
            txt_state.visible = true;
            txt_next.visible = false;
            icon_bei.visible = false;
            this.img_chain.visible = false;
            if(param2.challengeTimes > 0)
            {
               this.redpoint.visible = true;
               this.redpoint.txt_count.text = param2.challengeTimes + "";
            }
            else
            {
               this.redpoint.visible = false;
            }
            this.addEventListener("click",onClick);
            this.buttonMode = true;
         }
         if(buttonMode)
         {
            this.addEventListener("rollOver",onOver);
            this.addEventListener("rollOut",onOut);
         }
         if(ActivityModel.ins.have(1011))
         {
            _loc4_ = new ActivityDoubleTip();
            this.addChild(_loc4_);
            _loc4_.x = 138;
            _loc4_.y = 79;
         }
      }
      
      private function onOver(param1:MouseEvent) : void
      {
         this.img_hl.visible = true;
      }
      
      private function onOut(param1:MouseEvent) : void
      {
         this.img_hl.visible = false;
      }
   }
}
