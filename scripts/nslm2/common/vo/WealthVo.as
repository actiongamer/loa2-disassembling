package nslm2.common.vo
{
   import nslm2.utils.WealthUtil;
   import proto.Item;
   import proto.HeroInfo;
   import proto.BaoWu;
   import proto.PetInfo;
   import nslm2.modules.bag.itemModuels.LackItemIdFatal;
   import com.mz.core.configs.EnvConfig;
   import nslm2.common.model.HeroModel;
   import nslm2.modules.cultivates.militaryInfos.MilitaryModel;
   import nslm2.common.model.PlayerModel;
   import com.mz.core.logging.Log;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.modules.roleInfos.HeroInfoUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import com.netease.protobuf.UInt64;
   import com.mz.core.utils.TextFieldUtil;
   import nslm2.mgrs.skins.ColorLib;
   
   public class WealthVo
   {
      
      public static const KIND:String = "kind";
      
      public static const SID:String = "sid";
      
      public static const USE_ICON_KIND_AUTO:int = 0;
      
      public static const USE_ICON_KIND_NORMAL:int = 1;
      
      public static const USE_ICON_KIND_MINI:int = 2;
      
      public static const ICON_SMALL_SIZE:int = 26;
       
      
      public var kind:uint;
      
      public var sid:uint;
      
      public var count:Number;
      
      public var useStcCount:Boolean;
      
      public var item:Item;
      
      public var hero:HeroInfo;
      
      private var _treasure:BaoWu;
      
      public var petInfo:PetInfo;
      
      public var extraData:Object;
      
      public var useIconKind:int;
      
      private var _stcItemVo:StcItemVo;
      
      private var _stcNpcVo:StcNpcVo;
      
      public function WealthVo()
      {
         extraData = {};
         super();
      }
      
      public static function parseCostStr(param1:String, param2:Boolean = true) : WealthVo
      {
         return WealthUtil.parseCostStr(param1,param2);
      }
      
      public function get treasure() : BaoWu
      {
         return _treasure;
      }
      
      public function set treasure(param1:BaoWu) : void
      {
         _treasure = param1;
      }
      
      public function qualitySkin(param1:String) : String
      {
         var _loc2_:int = this.quality;
         if(_loc2_ > 0)
         {
            return param1 + _loc2_;
         }
         return null;
      }
      
      public function get quality() : int
      {
         var _loc1_:* = this.kind;
         if(20 !== _loc1_)
         {
            if(2121 !== _loc1_)
            {
               if(30 !== _loc1_)
               {
                  if(0 !== _loc1_)
                  {
                     return 1;
                  }
               }
               else
               {
                  if(this.stcNpcVo)
                  {
                     if(EnvConfig.ins.useServer && HeroModel.ins.isCurPlayerHeroByStcNpcId(this.sid))
                     {
                        return MilitaryModel.ins.getPlayerQuality(PlayerModel.ins.playerInfo.militaryrank);
                     }
                     return stcNpcVo.quality;
                  }
                  Log.fatal(this,"stcNpcVo is null when sid==" + this.sid);
               }
               return 0;
            }
         }
         if(stcItemVo)
         {
            return stcItemVo.quality;
         }
         new LackItemIdFatal(this,this.sid);
         return 0;
      }
      
      public function set_useMiniIcon(param1:int) : WealthVo
      {
         this.useIconKind = param1;
         return this;
      }
      
      public function iconUrl(param1:int = 48) : String
      {
         var _loc2_:* = this.kind;
         if(20 !== _loc2_)
         {
            if(2121 !== _loc2_)
            {
               if(30 !== _loc2_)
               {
                  if(0 !== _loc2_)
                  {
                     if(useIconKind == 2 || param1 <= 26 && useIconKind == 0)
                     {
                        return UrlLib.itemMiniIcon(kind);
                     }
                     return UrlLib.itemIcon(kind);
                  }
               }
               else
               {
                  if(this.hero)
                  {
                     return HeroInfoUtil.getHeadIconUrlByHeroBaseInfo(this.hero.baseInfo);
                  }
                  if(this.sid > 0)
                  {
                     return HeroInfoUtil.getHeadIconUrl(null,this.sid);
                  }
                  Log.fatal(this,"stcNpcVo is null when sid==" + this.sid);
               }
               return null;
            }
            if(stcItemVo)
            {
               return UrlLib.itemIcon(stcItemVo.icon);
            }
            new LackItemIdFatal(this,this.sid);
            return "";
         }
         if(stcItemVo)
         {
            if(stcItemVo.kind == 21)
            {
               return UrlLib.headIcon(stcItemVo.heroPiece_stcNpcId.toString());
            }
            if(useIconKind == 2)
            {
               return UrlLib.itemMiniIcon(stcItemVo.icon);
            }
            return UrlLib.itemIcon(stcItemVo.icon);
         }
         return null;
      }
      
      public function get showName() : String
      {
         var _loc1_:* = this.kind;
         if(20 !== _loc1_)
         {
            if(2121 !== _loc1_)
            {
               if(30 !== _loc1_)
               {
                  if(0 !== _loc1_)
                  {
                     return LocaleMgr.ins.getStr(3000 + this.kind);
                  }
               }
               else
               {
                  if(this.hero)
                  {
                     return HeroInfoUtil.getName(this.hero.baseInfo.id,this.hero.baseInfo.baseId);
                  }
                  if(this.sid > 0)
                  {
                     return HeroInfoUtil.getName(null,this.sid);
                  }
                  Log.fatal(this,"stcNpcVo is null when sid==" + this.sid);
               }
               return "";
            }
         }
         if(stcItemVo)
         {
            return LocaleMgr.ins.getStr(stcItemVo.name);
         }
         new LackItemIdFatal(this,this.sid);
         return "";
      }
      
      public function get isEnough() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = PlayerModel.ins.getCountByWealthVo(this);
         if(item)
         {
            _loc1_ = this.item.count;
         }
         else
         {
            _loc1_ = this.count;
         }
         return _loc2_ >= _loc1_;
      }
      
      public function get showCount() : int
      {
         if(this.useStcCount)
         {
            return hadCount;
         }
         if(item)
         {
            return this.item.count;
         }
         return this.count;
      }
      
      public function get hadCount() : int
      {
         return PlayerModel.ins.getCountByWealthVo(this);
      }
      
      public function get need() : int
      {
         return this.count;
      }
      
      public function get stcItemVo() : StcItemVo
      {
         if(this.kind == 20 || kind == 2121)
         {
            if(_stcItemVo == null || _stcItemVo.id != this.sid || item != null && item.itemId != _stcItemVo.id)
            {
               if(item != null)
               {
                  _stcItemVo = StcMgr.ins.getItemVo(item.itemId);
               }
               else
               {
                  _stcItemVo = StcMgr.ins.getItemVo(this.sid);
               }
            }
            return _stcItemVo;
         }
         return null;
      }
      
      public function get stcNpcVo() : StcNpcVo
      {
         if(this.kind == 30)
         {
            if(_stcNpcVo == null || _stcNpcVo.id != this.sid)
            {
               _stcNpcVo = StcMgr.ins.getNpcVo(this.sid);
            }
            return _stcNpcVo;
         }
         return null;
      }
      
      public function clone() : WealthVo
      {
         var _loc1_:WealthVo = new WealthVo();
         _loc1_.kind = this.kind;
         _loc1_.sid = this.sid;
         _loc1_.count = this.count;
         _loc1_.useStcCount = this.useStcCount;
         _loc1_.item = this.item;
         _loc1_.hero = this.hero;
         return _loc1_;
      }
      
      public function get id() : UInt64
      {
         if(item)
         {
            return item.id;
         }
         if(treasure)
         {
            return treasure.id;
         }
         return null;
      }
      
      public function get itemId() : int
      {
         return sid;
      }
      
      public function get qualityName() : String
      {
         if(stcItemVo)
         {
            return TextFieldUtil.htmlText2(LocaleMgr.ins.getStr(stcItemVo.name),ColorLib.qualityColor(stcItemVo.quality));
         }
         return "";
      }
   }
}
