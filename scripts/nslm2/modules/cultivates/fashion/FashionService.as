package nslm2.modules.cultivates.fashion
{
   import flash.events.EventDispatcher;
   import com.mz.core.event.MzEvent;
   import proto.ClothesWearReq;
   import nslm2.nets.sockets.ServerEngine;
   import proto.FashionWearReq;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.vos.StcFashionSynVo;
   import proto.ProtocolStatusRes;
   import proto.FashionList;
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.modules.foundations.mainToolBar.SwitchModuleRedPointMsg;
   import nslm2.mgrs.stcMgrs.vos.StcFashionExtraSkillVo;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.foundations.AlertUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.utils.TextFieldUtil;
   import proto.ClothesSkillReq;
   import proto.ClothesActiveReq;
   import proto.ClothesActiveRes;
   import proto.ClothesSkillBagRes;
   import proto.ClothesBagRes;
   
   public class FashionService extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.cultivates.fashion.FashionService;
       
      
      private var _reqClothKind:int;
      
      private var _reqClothId:int;
      
      private var _reqWingKind:int;
      
      private var _reqWingId:int;
      
      private var _reqAccKind:int;
      
      private var _reqNorSkillKind:int;
      
      private var _reqNorSkillId:int;
      
      private var _reqSpeSkillKind:int;
      
      private var _reqSpeSkillId:int;
      
      private var _activateId:int;
      
      public function FashionService()
      {
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.fashion.FashionService
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.fashion.FashionService();
         }
         return _ins;
      }
      
      private function get model() : FashionModel
      {
         return FashionModel.ins;
      }
      
      public function fashionWearAll(param1:int, param2:int) : void
      {
         if(model.hasActivatedFashion(param1) == false && param1 != 0)
         {
            model.dispatchEvent(new MzEvent("evtFashionUsingChange",["ERROR",param1]));
            return;
         }
         if(model.hasActivatedFashion(param2) == false && param2 != 0)
         {
            model.dispatchEvent(new MzEvent("evtFashionUsingChange",["ERROR",param2]));
            return;
         }
         this.clothesWear(10,param1);
         this.clothesWear(12,param2);
      }
      
      public function skillAll(param1:int, param2:int) : void
      {
         this.clothesSkill(0,param1);
         this.clothesSkill(1,param2);
      }
      
      public function clothesWear(param1:int, param2:uint) : void
      {
         var _loc3_:ClothesWearReq = new ClothesWearReq();
         switch(int(param1) - 10)
         {
            case 0:
               _reqClothKind = int(param2 != 0);
               if(model.usingClothId == param2)
               {
                  return;
               }
               _reqClothId = param2 == 0?model.usingClothId:param2;
               _loc3_.id = _reqClothId;
               _loc3_.kind = _reqClothKind;
               ServerEngine.ins.send(5302,_loc3_,server_clothesWear);
               break;
            default:
               _reqClothKind = int(param2 != 0);
               if(model.usingClothId == param2)
               {
                  return;
               }
               _reqClothId = param2 == 0?model.usingClothId:param2;
               _loc3_.id = _reqClothId;
               _loc3_.kind = _reqClothKind;
               ServerEngine.ins.send(5302,_loc3_,server_clothesWear);
               break;
            case 2:
               _reqWingKind = int(param2 != 0);
               if(model.usingWingId == param2)
               {
                  return;
               }
               _reqWingId = param2 == 0?model.usingWingId:param2;
               _loc3_.id = _reqWingId;
               _loc3_.kind = _reqWingKind;
               ServerEngine.ins.send(5302,_loc3_,server_clothesWear);
               break;
         }
      }
      
      public function fashionAccWear(param1:int, param2:uint, param3:int) : void
      {
         var _loc4_:* = null;
         var _loc6_:FashionWearReq = new FashionWearReq();
         var _loc5_:StcItemVo = StcMgr.ins.getItemVo(param2);
         switch(int(param1) - 15)
         {
            case 0:
               _reqClothKind = int(param2 != 0);
               if(param2 > 0 && model.usingLeftAccId == param3)
               {
                  return;
               }
               _reqClothId = param2 == 0?model.usingLeftAccId:param2;
               _loc4_ = StcMgr.ins.getVoByColumnValue("static_fashion_syn","item",param3);
               _reqAccKind = _loc4_.id;
               _loc6_.id = _loc4_.id;
               _loc6_.kind = _reqClothKind;
               ServerEngine.ins.send(6287,_loc6_,server_accLeftWear);
               break;
            case 1:
               _reqWingKind = int(param2 != 0);
               if(param2 > 0 && model.usingRightAccId == param2)
               {
                  return;
               }
               _reqWingId = param2 == 0?model.usingRightAccId:param2;
               _loc4_ = StcMgr.ins.getVoByColumnValue("static_fashion_syn","item",param3);
               _reqAccKind = _loc4_.id;
               _loc6_.id = _loc4_.id;
               _loc6_.kind = _reqWingKind;
               ServerEngine.ins.send(6287,_loc6_,server_accRightWear);
               break;
         }
      }
      
      private function server_accLeftWear(param1:ProtocolStatusRes) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = model.fashionAccArr;
         for each(var _loc2_ in model.fashionAccArr)
         {
            if(_loc2_.id == _reqAccKind)
            {
               if(_reqClothKind == 1)
               {
                  _loc2_.curUseId = true;
                  model.usingLeftAccId = StcMgr.ins.getFashionSynVo(_reqAccKind).item;
               }
               else
               {
                  _loc2_.curUseId = false;
                  model.usingLeftAccId = 0;
               }
            }
            else
            {
               _loc2_.curUseId = false;
            }
         }
         updateLeftSkill();
         clear();
         model.dispatchEvent(new MzEvent("evtFashionUsingChange",["OK"]));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(31220,true));
      }
      
      private function server_accRightWear(param1:ProtocolStatusRes) : void
      {
         var _loc4_:int = 0;
         var _loc3_:* = model.fashionAccArr;
         for each(var _loc2_ in model.fashionAccArr)
         {
            if(_loc2_.id == _reqAccKind)
            {
               if(_reqWingKind == 1)
               {
                  _loc2_.curUseId = true;
                  model.usingRightAccId = StcMgr.ins.getFashionSynVo(_reqAccKind).item;
               }
               else
               {
                  _loc2_.curUseId = false;
                  model.usingRightAccId = 0;
               }
            }
            else
            {
               _loc2_.curUseId = false;
            }
         }
         updateRightSkill();
         clear();
         model.dispatchEvent(new MzEvent("evtFashionUsingChange",["OK"]));
         ObserverMgr.ins.sendNotice("MSG_SWITCH_MODULE_REN_POINT",new SwitchModuleRedPointMsg(31220,true));
      }
      
      private function updateLeftSkill() : void
      {
         var _loc3_:int = 0;
         var _loc2_:Boolean = false;
         var _loc5_:* = null;
         var _loc1_:StcFashionExtraSkillVo = StcMgr.ins.getFashionExtraSkillVo(StcMgr.ins.getFashionSynVo(_reqAccKind).skill);
         if(_loc1_)
         {
            _loc3_ = _loc1_.skillId;
            _loc2_ = false;
            var _loc7_:int = 0;
            var _loc6_:* = PlayerModel.ins.playerInfo.playerHero.baseInfo.skill;
            for each(var _loc4_ in PlayerModel.ins.playerInfo.playerHero.baseInfo.skill)
            {
               _loc5_ = StcMgr.ins.getVoByColumnValue("static_fashion_extra_skill","skillId",_loc4_);
               if(_loc5_)
               {
                  if(StcMgr.ins.getFashionExtraSkillVo(StcMgr.ins.getFashionSynVo(_reqAccKind).skill).kind == _loc5_.kind)
                  {
                     if(_reqClothKind == 1)
                     {
                        _loc2_ = true;
                        ArrayUtil.replaceItem(PlayerModel.ins.playerInfo.playerHero.baseInfo.skill,_loc4_,_loc3_);
                        AlertUtil.float(LocaleMgr.ins.getStr(31210005,[TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(_loc3_).name),458496)]));
                     }
                     else
                     {
                        ArrayUtil.removeItem(PlayerModel.ins.playerInfo.playerHero.baseInfo.skill,_loc4_);
                        AlertUtil.float(LocaleMgr.ins.getStr(31210006,[TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(_loc3_).name),458496)]));
                     }
                  }
               }
            }
            if(_reqClothKind == 1 && !_loc2_)
            {
               if(PlayerModel.ins.playerInfo.playerHero.baseInfo.skill.indexOf(_loc3_) == -1)
               {
                  PlayerModel.ins.playerInfo.playerHero.baseInfo.skill.push(_loc3_);
                  AlertUtil.float(LocaleMgr.ins.getStr(31210005,[TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(_loc3_).name),458496)]));
               }
            }
         }
      }
      
      private function updateRightSkill() : void
      {
         var _loc3_:int = 0;
         var _loc2_:Boolean = false;
         var _loc5_:* = null;
         var _loc1_:StcFashionExtraSkillVo = StcMgr.ins.getFashionExtraSkillVo(StcMgr.ins.getFashionSynVo(_reqAccKind).skill);
         if(_loc1_)
         {
            _loc3_ = _loc1_.skillId;
            _loc2_ = false;
            var _loc7_:int = 0;
            var _loc6_:* = PlayerModel.ins.playerInfo.playerHero.baseInfo.skill;
            for each(var _loc4_ in PlayerModel.ins.playerInfo.playerHero.baseInfo.skill)
            {
               _loc5_ = StcMgr.ins.getVoByColumnValue("static_fashion_extra_skill","skillId",_loc4_);
               if(_loc5_)
               {
                  if(StcMgr.ins.getFashionExtraSkillVo(StcMgr.ins.getFashionSynVo(_reqAccKind).skill).kind == _loc5_.kind)
                  {
                     if(_reqWingKind == 1)
                     {
                        _loc2_ = true;
                        ArrayUtil.replaceItem(PlayerModel.ins.playerInfo.playerHero.baseInfo.skill,_loc4_,_loc3_);
                        AlertUtil.float(LocaleMgr.ins.getStr(31210005,[TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(_loc3_).name),458496)]));
                     }
                     else
                     {
                        ArrayUtil.removeItem(PlayerModel.ins.playerInfo.playerHero.baseInfo.skill,_loc4_);
                        AlertUtil.float(LocaleMgr.ins.getStr(31210006,[TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(_loc3_).name),458496)]));
                     }
                  }
               }
            }
            if(_reqWingKind == 1 && !_loc2_)
            {
               if(PlayerModel.ins.playerInfo.playerHero.baseInfo.skill.indexOf(_loc3_) == -1)
               {
                  PlayerModel.ins.playerInfo.playerHero.baseInfo.skill.push(_loc3_);
                  AlertUtil.float(LocaleMgr.ins.getStr(31210005,[TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(StcMgr.ins.getSkillVo(_loc3_).name),458496)]));
               }
            }
         }
      }
      
      public function clothesSkill(param1:uint, param2:uint) : void
      {
         var _loc3_:ClothesSkillReq = new ClothesSkillReq();
         if(!(int(param1) - 1))
         {
            _reqSpeSkillKind = int(param2 != 0);
            if(model.usingSpecialSkillId == param2)
            {
               return;
            }
            _reqSpeSkillId = param2 == 0?model.usingSpecialSkillId:param2;
            _loc3_.kind = _reqSpeSkillKind;
            _loc3_.skillId = _reqSpeSkillId;
            ServerEngine.ins.send(5303,_loc3_,server_clothesSkill);
         }
         else
         {
            _reqNorSkillKind = int(param2 != 0);
            if(model.usingNormalSkillId == param2)
            {
               return;
            }
            _reqNorSkillId = param2 == 0?model.usingNormalSkillId:param2;
            _loc3_.kind = _reqNorSkillKind;
            _loc3_.skillId = _reqNorSkillId;
            ServerEngine.ins.send(5303,_loc3_,server_clothesSkill);
         }
      }
      
      public function clothesSkillBag() : void
      {
         ServerEngine.ins.send(5304,null,server_clothesSkillBag);
      }
      
      public function clothesBag() : void
      {
         ServerEngine.ins.send(5301,null,server_clothesBag);
      }
      
      public function activateClothes(param1:int) : void
      {
         _activateId = param1;
         var _loc2_:ClothesActiveReq = new ClothesActiveReq();
         _loc2_.id = param1;
         ServerEngine.ins.send(5305,_loc2_,server_activeCpl);
      }
      
      private function server_activeCpl(param1:ClothesActiveRes) : void
      {
         model.onDataChangeOne(param1,_activateId);
      }
      
      private function server_clothesWear(param1:ProtocolStatusRes) : void
      {
         model.changeFashion(_reqClothKind,_reqClothId);
         model.changeFashion(_reqWingKind,_reqWingId);
         clear();
      }
      
      public function server_clothesSkillBag(param1:ClothesSkillBagRes) : void
      {
         model.resetSkill(param1);
      }
      
      public function server_clothesBag(param1:ClothesBagRes) : void
      {
         model.resetFashion(param1);
      }
      
      private function server_clothesSkill(param1:ProtocolStatusRes) : void
      {
         model.changeSkill(_reqNorSkillKind,_reqNorSkillId);
         model.changeSkill(_reqSpeSkillKind,_reqSpeSkillId);
         clear();
      }
      
      private function clear() : void
      {
         _reqClothKind = 0;
         _reqClothId = 0;
         _reqWingKind = 0;
         _reqAccKind = 0;
         _reqWingId = 0;
         _reqNorSkillKind = 0;
         _reqNorSkillId = 0;
         _reqSpeSkillKind = 0;
         _reqSpeSkillId = 0;
      }
   }
}
