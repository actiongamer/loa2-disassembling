package nslm2.modules.roleInfos.awake.render
{
   import game.ui.roleInfos.awake.render.RoleAwakeNeedRenderUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.mgrs.stcMgrs.vos.StcGridNodeVo;
   import nslm2.common.vo.WealthVo;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.roleInfos.awake.RoleAwakeUtil;
   import com.mz.core.utils.FilterUtil;
   import flash.events.MouseEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.modules.roleInfos.RoleInfoModel;
   
   public class RoleAwakeNeedRender extends RoleAwakeNeedRenderUI implements IObserver
   {
       
      
      private var _state:int;
      
      private var _vo:StcGridNodeVo;
      
      private var _wealthVo:WealthVo;
      
      private var _eff:BmcSpriteSheet;
      
      public function RoleAwakeNeedRender()
      {
         super();
      }
      
      public function get vo() : StcGridNodeVo
      {
         return _vo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(param1 as StcGridNodeVo)
         {
            _vo = param1 as StcGridNodeVo;
         }
         if(this.vo)
         {
            this.addEventListener("click",onClick);
            _wealthVo = WealthUtil.parseCostStr(vo.cost_item);
            this.render_item.dataSource = _wealthVo;
            _state = RoleAwakeUtil.checkHeroStatus(vo);
            changeView();
         }
      }
      
      private function changeView() : void
      {
         switch(int(_state))
         {
            case 0:
               if(_eff)
               {
                  _eff.stop();
                  _eff.visible = false;
               }
               this.render_item.img_icon.filters = [];
               this.txt_get.visible = false;
               this.img_plus.visible = false;
               break;
            case 1:
               if(!_eff)
               {
                  _eff = new BmcSpriteSheet();
                  _eff.x = -12;
                  _eff.y = -12;
                  _eff.init(1118,1,"all",true);
                  _eff.scale = 0.895238095238095;
                  this.addChild(_eff);
               }
               else
               {
                  _eff.visible = true;
                  _eff.gotoAndPlay(1);
               }
               this.txt_get.visible = false;
               this.img_plus.visible = false;
               this.render_item.img_icon.filters = [FilterUtil.grayFilter(),FilterUtil.highLightFilter(-25)];
               break;
            case 2:
               if(_eff)
               {
                  _eff.stop();
                  _eff.visible = false;
               }
               this.render_item.img_icon.filters = [FilterUtil.grayFilter(),FilterUtil.highLightFilter(-25)];
               this.txt_get.visible = false;
               this.img_plus.visible = true;
               break;
            case 3:
               if(_eff)
               {
                  _eff.stop();
                  _eff.visible = false;
               }
               this.render_item.img_icon.filters = [FilterUtil.grayFilter(),FilterUtil.highLightFilter(-25)];
               this.img_plus.visible = false;
               break;
            case 4:
               if(_eff)
               {
                  _eff.stop();
                  _eff.visible = false;
               }
               this.render_item.img_icon.filters = [FilterUtil.grayFilter(),FilterUtil.highLightFilter(-25)];
               this.img_plus.visible = false;
         }
      }
      
      public function playEff() : void
      {
         var _loc1_:BmcSpriteSheet = new BmcSpriteSheet();
         _loc1_.x = -34;
         _loc1_.y = -29;
         _loc1_.init(1060);
         this.addChild(_loc1_);
         _state = 0;
         changeView();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(int(_state) - 1)
         {
            case 0:
               ModuleMgr.ins.showModule(30122,this.vo,ModuleMgr.ins.popLayer.curModuleId);
               break;
            case 1:
            case 2:
               if(RoleInfoModel.ins.heroInfo == null)
               {
                  return;
               }
               ModuleMgr.ins.showModule(30122,this.vo,ModuleMgr.ins.popLayer.curModuleId);
               break;
         }
      }
      
      public function getFocusNotices() : Array
      {
         return ["msg_role_awake_equip_cpl"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("msg_role_awake_equip_cpl" === _loc3_)
         {
            if(this.vo.id == (param2 as StcGridNodeVo).id)
            {
               playEff();
            }
         }
      }
   }
}
