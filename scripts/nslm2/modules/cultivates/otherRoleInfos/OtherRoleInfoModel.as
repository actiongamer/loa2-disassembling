package nslm2.modules.cultivates.otherRoleInfos
{
   import flash.events.EventDispatcher;
   import com.netease.protobuf.UInt64;
   import proto.PetInfo;
   import proto.HeroInfo;
   import proto.PlayerQQInfo;
   import proto.ViewOtherPlayerRes;
   import nslm2.utils.Uint64Util;
   import com.mz.core.utils.ArrayUtil;
   import com.mz.core.event.MzEvent;
   import nslm2.modules.footstones.moduleBases.ModuleMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.modules.cultivates.roleTeam.vo.YuanJunVo;
   import nslm2.modules.roleInfos.equipPanels.MengYuePropVo;
   import proto.PanelBaseInfo;
   import nslm2.modules.cultivates.roleTeam.vo.RoleTeamVo;
   import proto.BuZhen;
   import proto.Item;
   
   public class OtherRoleInfoModel extends EventDispatcher
   {
      
      private static var _ins:nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel;
       
      
      public var ability:UInt64;
      
      public var aura:uint;
      
      public var horse:uint;
      
      public var pet:PetInfo;
      
      public var roleId:UInt64;
      
      public var name:String;
      
      public var playerHero:HeroInfo;
      
      public var clothId:uint;
      
      public var wingId:uint;
      
      public var crtHeroId:UInt64;
      
      public var selectedPos:int = 1;
      
      public var heroInfo:HeroInfo;
      
      public var military:int;
      
      public var fashionCount:int;
      
      public var horseCount:int;
      
      public var qqInfo:PlayerQQInfo;
      
      public var fashion:Array;
      
      public var skinList:Array;
      
      public var skinSuitCount:Object;
      
      public var activatedHorseList:Array;
      
      public var horseMasterLevel:int;
      
      public var fashionAccList:Array;
      
      private var _heroArrExceptPlayer:Array;
      
      private var _yuanJunArr:Array;
      
      private var _teamHeroArr:Array;
      
      public var heroArr:Array;
      
      public var guildTechList:Array;
      
      public var familyName:String;
      
      public function OtherRoleInfoModel()
      {
         skinSuitCount = {};
         super();
      }
      
      public static function get ins() : nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel
      {
         if(_ins == null)
         {
            _ins = new nslm2.modules.cultivates.otherRoleInfos.OtherRoleInfoModel();
         }
         return _ins;
      }
      
      public function onDataChangeOne(param1:ViewOtherPlayerRes) : void
      {
         if(param1)
         {
            this.ability = Uint64Util.clone(param1.ability);
            this.aura = param1.horseGlory;
            this._heroArrExceptPlayer = param1.heroes.sort(sortTeamHero);
            this.playerHero = param1.role;
            this.heroArr = ArrayUtil.concat([this.playerHero],this._heroArrExceptPlayer);
            this.horse = param1.horse;
            this.roleId = Uint64Util.clone(param1.id);
            this.name = param1.name;
            setFashion(param1.fashionNow);
            this.heroInfo = this.playerHero;
            this.military = param1.military;
            this.horseCount = param1.horseCount;
            this.fashion = param1.fashion;
            this.fashionCount = param1.fashionCount;
            this.qqInfo = new PlayerQQInfo();
            this.activatedHorseList = param1.horseIds;
            this.horseMasterLevel = param1.horseStar;
            this.guildTechList = param1.familyTech;
            this.fashionAccList = param1.fashionList;
            this.familyName = param1.familyName;
            this.pet = param1.pet;
            parseSkinList(param1.heroSkinList);
            this.dispatchEvent(new MzEvent("evt_get_data_cpl"));
            ModuleMgr.ins.showModule(11600,null,ModuleMgr.ins.popLayer.curModuleId);
            return;
         }
         this.dispatchEvent(new MzEvent("evt_get_data_error"));
         throw new Error("服务端返回数据为空！");
      }
      
      public function isPlayerHero(param1:UInt64) : Boolean
      {
         return Uint64Util.equal(param1,this.playerHero.baseInfo.id);
      }
      
      public function getNameHasTupoLevel(param1:HeroInfo, param2:Boolean = false) : String
      {
         var _loc4_:* = null;
         var _loc3_:String = "";
         if(isPlayerHero(param1.baseInfo.id))
         {
            _loc3_ = _loc3_ + this.name;
         }
         else
         {
            _loc4_ = StcMgr.ins.getNpcVo(param1.baseInfo.baseId);
            if(_loc4_)
            {
               if(param2)
               {
                  _loc3_ = _loc3_ + LocaleMgr.ins.getStr(int(_loc4_.node + 999800000));
               }
               else
               {
                  _loc3_ = _loc3_ + LocaleMgr.ins.getStr(int(_loc4_.name));
               }
            }
            else
            {
               new StcLackFatal(HeroInfoUtil,"static_npc",param1.baseInfo.baseId);
               _loc3_ = _loc3_ + "";
            }
         }
         var _loc5_:StcNpcVo = StcMgr.ins.getNpcVo(param1.baseInfo.baseId);
         if(_loc5_)
         {
            if(_loc5_.tupo > 0)
            {
               _loc3_ = _loc3_ + (" +" + _loc5_.tupo);
            }
         }
         return _loc3_;
      }
      
      public function getHeroInfo(param1:UInt64) : HeroInfo
      {
         var _loc4_:int = 0;
         var _loc3_:* = heroArr;
         for each(var _loc2_ in heroArr)
         {
            if(Uint64Util.equal(param1,_loc2_.baseInfo.id))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function setFashion(param1:Array) : void
      {
         var _loc2_:* = null;
         this.clothId = 0;
         this.wingId = 0;
         var _loc5_:int = 0;
         var _loc4_:* = param1;
         for each(var _loc3_ in param1)
         {
            _loc2_ = StcMgr.ins.getItemVo(_loc3_);
            if(_loc2_)
            {
               switch(int(_loc2_.kind) - 10)
               {
                  case 0:
                     this.clothId = _loc2_.id;
                     continue;
                  default:
                     continue;
                  case 2:
                     this.wingId = _loc2_.id;
                     continue;
               }
            }
            else
            {
               continue;
            }
         }
      }
      
      public function get yuanJunArr() : Array
      {
         updateYuanJunArr();
         return _yuanJunArr;
      }
      
      public function updateYuanJunArr() : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:int = 0;
         _yuanJunArr = [];
         var _loc1_:Array = [];
         var _loc7_:int = 0;
         var _loc6_:* = _heroArrExceptPlayer;
         for each(var _loc5_ in _heroArrExceptPlayer)
         {
            if(_loc5_.baseInfo.place > 20)
            {
               _loc1_.push(_loc5_);
            }
         }
         _loc3_ = 1;
         while(_loc3_ <= 6)
         {
            _loc2_ = null;
            _loc4_ = new YuanJunVo();
            _loc4_.index = _loc3_;
            var _loc9_:int = 0;
            var _loc8_:* = _loc1_;
            for each(_loc5_ in _loc1_)
            {
               if(_loc5_.baseInfo.place == _loc3_ + 20)
               {
                  _loc2_ = _loc5_;
               }
            }
            if(_loc2_ == null)
            {
               _loc4_.heroData = null;
            }
            else
            {
               _loc4_.heroData = HeroInfoUtil.heroBaseInfoToPanelBaseInfo(_loc2_.baseInfo);
            }
            _yuanJunArr.push(_loc4_);
            _loc3_++;
         }
      }
      
      public function get totalYuanFengCnt() : int
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc5_:int = 0;
         var _loc4_:* = _heroArrExceptPlayer;
         for each(var _loc3_ in _heroArrExceptPlayer)
         {
            if(_loc3_.baseInfo.position > 1)
            {
               _loc1_ = _loc1_ + MengYuePropVo.getActivateMengYueCnt(HeroInfoUtil.getNodeId(_loc3_.baseInfo.baseId),_loc3_.baseInfo.mengyue,1);
            }
         }
         return _loc1_;
      }
      
      public function get teamHeroArr() : Array
      {
         updateTeamHeroArr();
         return _teamHeroArr;
      }
      
      public function updateTeamHeroArr() : void
      {
         var _loc4_:* = null;
         var _loc1_:* = null;
         var _loc3_:int = 0;
         _teamHeroArr = [];
         _loc3_ = 1;
         while(_loc3_ <= 5)
         {
            _loc1_ = null;
            _loc4_ = new RoleTeamVo();
            _loc4_.index = _loc3_;
            var _loc6_:int = 0;
            var _loc5_:* = heroArr;
            for each(var _loc2_ in heroArr)
            {
               if(_loc2_.baseInfo.position == _loc3_)
               {
                  _loc1_ = HeroInfoUtil.heroBaseInfoToPanelBaseInfo(_loc2_.baseInfo);
               }
            }
            _loc4_.heroData = _loc1_;
            _teamHeroArr.push(_loc4_);
            _loc3_++;
         }
      }
      
      public function get teamHeroArrWithoutPlayer() : Array
      {
         updateTeamHeroArr();
         _teamHeroArr.shift();
         return _teamHeroArr;
      }
      
      public function getPositionList() : Array
      {
         var _loc3_:* = null;
         var _loc1_:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = heroArr;
         for each(var _loc2_ in heroArr)
         {
            if(_loc2_.baseInfo.place > 0 && _loc2_.baseInfo.place < 20)
            {
               _loc3_ = new BuZhen();
               _loc3_.id = _loc2_.baseInfo.id;
               _loc3_.place = _loc2_.baseInfo.place;
               _loc1_.push(_loc3_);
            }
         }
         return _loc1_;
      }
      
      private function sortTeamHero(param1:HeroInfo, param2:HeroInfo) : int
      {
         if(param1.baseInfo.position < param2.baseInfo.position)
         {
            return -1;
         }
         return 1;
      }
      
      private function parseSkinList(param1:Array) : void
      {
         var _loc2_:* = null;
         skinList = [];
         skinSuitCount = {};
         if(!param1)
         {
            return;
         }
         var _loc7_:int = 0;
         var _loc6_:* = param1;
         for each(var _loc3_ in param1)
         {
            if(_loc3_.isEquiped || _loc3_.place > 0)
            {
               _loc2_ = StcMgr.ins.getItemVo(_loc3_.itemId);
               skinList.push(_loc3_.itemId);
               if(skinSuitCount[_loc2_.extend_1] == null)
               {
                  skinSuitCount[_loc2_.extend_1] = 1;
               }
               else
               {
                  var _loc4_:* = _loc2_.extend_1;
                  var _loc5_:* = skinSuitCount[_loc4_] + 1;
                  skinSuitCount[_loc4_] = _loc5_;
               }
            }
         }
      }
   }
}
