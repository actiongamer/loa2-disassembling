package nslm2.modules.roleInfos.equipPanels
{
   import game.ui.roleInfos.equipPanels.RoleSelectEquipPanelUI;
   import nslm2.common.compsEffects.ImgMoveEffect;
   import nslm2.common.ctrls.ListPageBarCtrl;
   import flash.display.DisplayObject;
   import nslm2.modules.bag.itemModuels.BagModel;
   import nslm2.common.vo.WealthVo;
   import nslm2.modules.cultivates.treasure.model.TreasureModel;
   import nslm2.common.ui.components.comps2d.pageBar.PageBarS1;
   import nslm2.modules.cultivates.pet.model.PetModel;
   import nslm2.modules.cultivates.pet.vo.PetInfoVo;
   import nslm2.modules.footstones.newerGuideModules.NGUtil;
   import morn.core.components.List;
   import morn.core.components.Label;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.customs.components.WealthRender;
   import proto.EquipChangeReq;
   import proto.Item;
   import proto.BaoWu;
   import nslm2.modules.foundations.AlertUtil;
   import morn.core.handlers.Handler;
   import flash.geom.Point;
   import flash.events.Event;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.cultivates.treasure.service.TreasureService;
   import proto.PetProtectReq;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class RoleSelectEquipPanel extends RoleSelectEquipPanelUI
   {
       
      
      private var _imgClothEffect:ImgMoveEffect;
      
      private var pageCtrl:ListPageBarCtrl;
      
      private var targetDisplay:DisplayObject;
      
      private var toScale:Number;
      
      private var vo:nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo;
      
      private var petVo:nslm2.modules.roleInfos.equipPanels.EquipPetVo;
      
      private var render:WealthRender;
      
      private var req:EquipChangeReq;
      
      private var selectedItem:Item;
      
      private var selectedTreasure:BaoWu;
      
      private var equipTreasurePos:int;
      
      private var petRender:nslm2.modules.roleInfos.equipPanels.RoleSelectPetRender;
      
      public function RoleSelectEquipPanel()
      {
         _imgClothEffect = new ImgMoveEffect();
         super();
         this.mouseChildren = true;
         this.fadeViewId = 30101;
         (this.pageBar as PageBarS1).bindList(this.list_equipSelect);
         list_equipSelect.useMouseDown = false;
      }
      
      public function show(param1:Object, param2:DisplayObject = null, param3:Number = 1) : void
      {
         var _loc4_:* = null;
         targetDisplay = param2;
         toScale = param3;
         this.list_equipSelect.buttonMode = true;
         this.list_equipSelect.selectHandler = list_selectHandler;
         this.list_petSelect.buttonMode = true;
         this.list_petSelect.selectHandler = list_petHandler;
         if(param1 is nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo)
         {
            vo = param1 as nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo;
            if(vo.pos < 8)
            {
               _loc4_ = BagModel.ins.getEquipByPosAtBag(vo.pos);
               while(_loc4_.length == 0 || _loc4_.length % 8)
               {
                  _loc4_.push(new WealthVo());
               }
               this.list_equipSelect.dataSource = _loc4_;
            }
            else
            {
               this.list_equipSelect.dataSource = TreasureModel.ins.getTreausreByPos(vo.pos);
            }
            this.list_equipSelect.visible = true;
            list_petSelect.visible = false;
            (this.pageBar as PageBarS1).bindList(this.list_equipSelect);
         }
         else if(param1 is nslm2.modules.roleInfos.equipPanels.EquipPetVo)
         {
            this.list_equipSelect.visible = false;
            list_petSelect.visible = true;
            this.list_petSelect.itemRender = nslm2.modules.roleInfos.equipPanels.RoleSelectPetRender;
            petVo = param1 as nslm2.modules.roleInfos.equipPanels.EquipPetVo;
            _loc4_ = PetModel.ins.getCanProtectPetList();
            while(_loc4_.length < 8)
            {
               _loc4_.push(new PetInfoVo(0));
            }
            this.list_petSelect.dataSource = _loc4_;
            (this.pageBar as PageBarS1).bindList(this.list_petSelect);
         }
         this.list_equipSelect.repeatX = 4;
         this.list_equipSelect.repeatY = 2;
         this.panelFadeIn();
      }
      
      override public function fadeView_fadeInCpl() : void
      {
         NGUtil.checkModuleShow(30813,this);
      }
      
      private function pageNumFunc(param1:List, param2:Label) : void
      {
         if(param1.totalPage)
         {
            param2.text = LocaleMgr.ins.getStr(999000496,[param1.page + 1,param1.totalPage]);
         }
         else
         {
            param2.text = "";
         }
      }
      
      private function list_selectHandler(param1:int) : void
      {
         if(param1 == -1)
         {
            return;
         }
         render = this.list_equipSelect.getCell(param1) as WealthRender;
         var _loc2_:WealthVo = this.list_equipSelect.getItem(param1) as WealthVo;
         selectedItem = _loc2_.item;
         selectedTreasure = _loc2_.treasure;
         if(_loc2_.treasure && _loc2_.treasure.statue == 0 && _loc2_.quality > 4)
         {
            this.list_equipSelect.selectedIndex = -1;
            AlertUtil.comfirm(LocaleMgr.ins.getStr(30610032),new Handler(doEquip,[_loc2_]));
         }
         else
         {
            doEquip(_loc2_);
         }
      }
      
      private function list_petHandler(param1:int) : void
      {
         if(param1 == -1)
         {
            return;
         }
         petRender = this.list_petSelect.getCell(param1) as nslm2.modules.roleInfos.equipPanels.RoleSelectPetRender;
         var _loc2_:PetInfoVo = this.list_petSelect.getItem(param1) as PetInfoVo;
         if(_loc2_.id > 0)
         {
            if(_loc2_.petInfo.position > 0)
            {
               AlertUtil.float(LocaleMgr.ins.getStr(32000094));
               this.list_petSelect.selectedIndex = -1;
            }
            else
            {
               doPetEquip(_loc2_);
            }
         }
      }
      
      private function doEquip(param1:WealthVo) : void
      {
         _imgClothEffect = new ImgMoveEffect();
         var _loc2_:Point = targetDisplay.localToGlobal(new Point(0,0));
         _imgClothEffect.config(0.3,toScale);
         _imgClothEffect.init(render.ref_img_icon,this.list_equipSelect.localToGlobal(new Point(render.x,render.y)),_loc2_,new Handler(effEndHandler,[param1]));
         _imgClothEffect.startAnim();
         this.dispatchEvent(new Event("close"));
      }
      
      private function doPetEquip(param1:PetInfoVo) : void
      {
         _imgClothEffect = new ImgMoveEffect();
         var _loc2_:Point = targetDisplay.localToGlobal(new Point(0,0));
         _imgClothEffect.config(0.3,toScale);
         _imgClothEffect.init(petRender.img_icon,this.list_petSelect.localToGlobal(new Point(petRender.x,petRender.y)),_loc2_,new Handler(petEffEndHandler,[param1]));
         _imgClothEffect.startAnim();
         this.dispatchEvent(new Event("close"));
      }
      
      private function effEndHandler(param1:WealthVo) : void
      {
         if(param1.item)
         {
            req = new EquipChangeReq();
            req.hero = vo.heroId;
            req.item = param1.item.id;
            req.place = vo.pos;
            ServerEngine.ins.send(8103,req,server_onChange);
         }
         else if(param1.treasure)
         {
            equipTreasurePos = param1.stcItemVo.kind;
            TreasureService.ins.baoWuEquip(vo.heroId,param1.treasure.id,vo.pos,equipBaowuSuccess);
         }
      }
      
      private function petEffEndHandler(param1:PetInfoVo) : void
      {
         var _loc2_:PetProtectReq = new PetProtectReq();
         _loc2_.id = param1.id;
         _loc2_.position = petVo.position;
         ServerEngine.ins.send(5365,_loc2_,equipPetSuccess);
      }
      
      private function equipBaowuSuccess() : void
      {
         ObserverMgr.ins.sendNotice("msg_role_info_change_treasure",[equipTreasurePos]);
         ObserverMgr.ins.sendNotice("treasure_wear",[targetDisplay,selectedTreasure]);
         NGUtil.checkRuneNg(true,true);
      }
      
      private function server_onChange() : void
      {
         ObserverMgr.ins.sendNotice("msgRoleInfo_ChangeEquip",[req,render]);
         ObserverMgr.ins.sendNotice("equip_wear_equip",[targetDisplay,selectedItem]);
      }
      
      private function equipPetSuccess() : void
      {
         (petRender.dataSource as PetInfoVo).petInfo.position = petVo.position;
         ObserverMgr.ins.sendNotice("msg_role_info_change_pet",[petVo.heroId]);
      }
   }
}
