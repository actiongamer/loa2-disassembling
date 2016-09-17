package nslm2.modules.foundations.vip.view
{
   import game.ui.vipModule.view.VipPrivilegesViewUI;
   import com.mz.core.interFace.IObserver;
   import nslm2.common.model.PlayerModel;
   import morn.core.components.Box;
   import nslm2.common.ui.components.comps2d.BmcSpriteSheet;
   import nslm2.modules.foundations.vip.render.VipPrivilegesRender;
   import flash.events.MouseEvent;
   import flash.display.Sprite;
   import com.greensock.TweenLite;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.foundations.vip.vo.VipVo;
   import game.ui.vipModule.render.VipTitleRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcVipVo;
   import nslm2.modules.foundations.vip.vo.VipTitleVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import game.ui.vipModule.render.VipBgRenderUI;
   import com.mz.core.utils.DisplayUtils;
   
   public class VipPrivilegesView extends VipPrivilegesViewUI implements IObserver
   {
       
      
      private var imgVipX:int = 0;
      
      private var prevSelection:Vector.<Box>;
      
      private var eff_forword:BmcSpriteSheet;
      
      private var eff_backword:BmcSpriteSheet;
      
      private var curPage:int;
      
      public function VipPrivilegesView()
      {
         var _loc4_:* = null;
         var _loc7_:int = 0;
         var _loc6_:* = null;
         super();
         ObserverMgr.ins.regObserver(this);
         this.tween_btn.visible = false;
         var _loc2_:Array = [];
         var _loc5_:Array = [];
         var _loc1_:Array = StcMgr.ins.getVipTable().array.sortOn("sort",16);
         _loc7_ = 0;
         while(_loc7_ < _loc1_.length)
         {
            _loc4_ = new VipVo();
            _loc4_.vip_level = _loc7_;
            if(_loc7_ < 16)
            {
               _loc2_.push(_loc4_);
               (this.list_viptitle.cells[_loc7_] as VipTitleRenderUI).txt_title.text = "VIP" + _loc7_;
            }
            if((_loc1_[_loc7_] as StcVipVo).is_show != 0)
            {
               _loc6_ = new VipTitleVo();
               _loc6_.desc = LocaleMgr.ins.getStr((_loc1_[_loc7_] as StcVipVo).name);
               _loc5_.push(_loc6_);
            }
            _loc7_++;
         }
         this.title_list.repeatY = _loc5_.length;
         this.title_list.dataSource = _loc5_;
         this.vip_list.repeatX = _loc2_.length;
         this.vip_list.dataSource = _loc2_;
         this.vip_list.height = title_list.height;
         var _loc3_:Sprite = new Sprite();
         _loc3_.graphics.lineStyle(null,0);
         _loc3_.graphics.beginFill(0);
         _loc3_.graphics.drawRect(this.list_viptitle.x + 5,this.list_viptitle.y,panel.width - this.vip_list.x - 32,this.list_viptitle.height);
         addChild(_loc3_);
         this.list_viptitle.mask = _loc3_;
         _loc3_ = new Sprite();
         _loc3_.graphics.lineStyle(null,0);
         _loc3_.graphics.beginFill(0);
         _loc3_.graphics.drawRect(this.vip_list.x,this.vip_list.y,this.panel.width - this.vip_list.x - 20,this.vip_list.height);
         panel.addChild(_loc3_);
         this.vip_list.mask = _loc3_;
         imgVipX = list_viptitle.x;
         this.tween_btn.btnLabel.visible = false;
         this.tween_btn.clickHandler = clickHandler;
         bg_list.repeatY = _loc5_.length;
         bg_list.mouseEnabled = false;
         _loc7_ = 0;
         while(_loc7_ < bg_list.cells.length)
         {
            if(_loc7_ % 2 == 1)
            {
               (bg_list.cells[_loc7_] as VipBgRenderUI).img_bg.visible = false;
            }
            bg_list.cells[_loc7_].mouseEnabled = false;
            _loc7_++;
         }
         vip_list.changeHandler = changeHandler;
         vip_list.selectedIndex = PlayerModel.ins.vip;
         changeHandler();
         eff_forword = new BmcSpriteSheet();
         eff_forword.x = tween_btn.x - 15;
         eff_forword.y = tween_btn.y - 9;
         eff_forword.init(10800002,1,"all",true,1,0);
         eff_forword.mouseChildren = true;
         eff_forword.mouseEnabled = true;
         eff_forword.buttonMode = true;
         eff_forword.addEventListener("click",effClickHandler1);
         DisplayUtils.addChildAbove(eff_forword,this.tween_btn);
         eff_backword = new BmcSpriteSheet();
         eff_backword.x = tween_btn.x - 15;
         eff_backword.y = tween_btn.y - 9;
         eff_backword.init(10800004,1,"all",true,1,0);
         eff_backword.mouseChildren = true;
         eff_backword.mouseEnabled = true;
         eff_backword.buttonMode = true;
         eff_backword.addEventListener("click",effClickHandler2);
         DisplayUtils.addChildAbove(eff_backword,this.tween_btn);
         change();
      }
      
      private function change() : void
      {
         if(PlayerModel.ins.vip > 5 && PlayerModel.ins.vip < 10)
         {
            vip_list.x = imgVipX - (PlayerModel.ins.vip - 5) * 51;
            list_viptitle.x = imgVipX - (PlayerModel.ins.vip - 5) * 51;
            this.eff_forword.visible = true;
            this.eff_backword.visible = false;
         }
         else if(PlayerModel.ins.vip > 9)
         {
            toPage1();
            this.eff_forword.visible = false;
            this.eff_backword.visible = false;
            vip_list.selectedIndex = PlayerModel.ins.vip;
         }
         if(PlayerModel.ins.vip <= 5)
         {
            this.eff_forword.visible = true;
            this.eff_backword.visible = false;
         }
      }
      
      private function changeHandler() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < (vip_list.selection as VipPrivilegesRender).func_list.cells.length)
         {
            (vip_list.selection as VipPrivilegesRender).func_list.cells[_loc1_].img_selected.visible = true;
            if(prevSelection && prevSelection != (vip_list.selection as VipPrivilegesRender).func_list.cells)
            {
               prevSelection[_loc1_].img_selected.visible = false;
            }
            _loc1_++;
         }
         prevSelection = (vip_list.selection as VipPrivilegesRender).func_list.cells;
      }
      
      private function effClickHandler1(param1:MouseEvent = null) : void
      {
         toPage1();
      }
      
      private function effClickHandler2(param1:MouseEvent = null) : void
      {
         toPage0();
      }
      
      private function clickHandler() : void
      {
         if(this.tween_btn.scaleX == 1)
         {
            toPage1();
         }
         else
         {
            toPage0();
         }
      }
      
      private function toPage1() : void
      {
         curPage = 1;
         var _loc1_:Sprite = this.list_viptitle.mask as Sprite;
         var _loc2_:Sprite = this.vip_list.mask as Sprite;
         this.tween_btn.mouseEvent = false;
         TweenLite.to(this.vip_list,1,{"x":imgVipX - 255});
         TweenLite.to(this.list_viptitle,1,{
            "x":imgVipX - 255,
            "onComplete":enableBtn
         });
         this.tween_btn.scaleX = -1;
         this.tween_btn.x = 766;
         this.tween_btn.visible = false;
         eff_forword.mouseChildren = false;
         eff_forword.mouseEnabled = false;
         _loc1_.graphics.clear();
         _loc1_.graphics.lineStyle(null,0);
         _loc1_.graphics.beginFill(0);
         _loc1_.graphics.drawRect(imgVipX + 5,this.list_viptitle.y,panel.width - imgVipX - 27,this.list_viptitle.height);
         _loc2_.graphics.clear();
         _loc2_.graphics.lineStyle(null,0);
         _loc2_.graphics.beginFill(0);
         _loc2_.graphics.drawRect(imgVipX + 5,this.vip_list.y,this.panel.width - imgVipX - 25,this.vip_list.height);
      }
      
      private function toPage0() : void
      {
         curPage = 0;
         var _loc1_:Sprite = this.list_viptitle.mask as Sprite;
         var _loc2_:Sprite = this.vip_list.mask as Sprite;
         this.tween_btn.mouseEvent = false;
         TweenLite.to(this.vip_list,1,{"x":183});
         TweenLite.to(this.list_viptitle,1,{
            "x":imgVipX,
            "onComplete":enableBtn
         });
         this.tween_btn.scaleX = 1;
         this.tween_btn.x = 728;
         this.tween_btn.visible = false;
         if(PlayerModel.ins.vip > 9)
         {
            this.eff_forword.visible = true;
            eff_forword.mouseChildren = false;
            eff_forword.mouseEnabled = false;
         }
         else
         {
            eff_backword.mouseEnabled = false;
            eff_backword.mouseChildren = false;
         }
         _loc1_.graphics.clear();
         _loc1_.graphics.lineStyle(null,0);
         _loc1_.graphics.beginFill(0);
         _loc1_.graphics.drawRect(imgVipX + 5,this.list_viptitle.y,panel.width - imgVipX - 32,this.list_viptitle.height);
         _loc2_.graphics.clear();
         _loc2_.graphics.lineStyle(null,0);
         _loc2_.graphics.beginFill(0);
         _loc2_.graphics.drawRect(imgVipX,this.vip_list.y,this.panel.width - imgVipX - 20,this.vip_list.height);
      }
      
      private function enableBtn() : void
      {
         if(curPage != 0)
         {
            if(PlayerModel.ins.vip < 10)
            {
               this.eff_backword.visible = true;
            }
            else
            {
               this.tween_btn.visible = true;
               this.tween_btn.mouseEvent = true;
            }
            this.eff_forword.visible = false;
         }
         else
         {
            this.eff_forword.visible = true;
            this.eff_backword.visible = false;
         }
         eff_backword.mouseEnabled = true;
         eff_backword.mouseChildren = true;
         eff_forword.mouseChildren = true;
         eff_forword.mouseEnabled = true;
      }
      
      public function getFocusNotices() : Array
      {
         return ["PLAYER_VIP_UP"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("PLAYER_VIP_UP" === _loc3_)
         {
            change();
            vip_list.selectedIndex = PlayerModel.ins.vip;
            changeHandler();
         }
      }
   }
}
