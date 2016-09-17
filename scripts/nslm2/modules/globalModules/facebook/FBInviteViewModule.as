package nslm2.modules.globalModules.facebook
{
   import game.ui.facebook.FBInviteViewUI;
   import morn.core.components.Button;
   import flash.events.MouseEvent;
   import com.mz.core.utils.ArrayUtil;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import com.mz.core.configs.ClientConfig;
   import nslm2.modules.foundations.AlertUtil;
   import com.mz.core.logging.Log;
   import com.mz.core.utils.LocalData;
   import nslm2.utils.ServerTimer;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.modules.globalModules.facebook.view.FBAllFriendsListRender;
   import nslm2.modules.globalModules.facebook.view.FBSelectedFriendsListRender;
   import nslm2.modules.globalModules.facebook.control.FBControl;
   import com.mz.core.configs.EnvConfig;
   import nslm2.utils.RTools;
   import proto.FacebookInviteRes;
   import flash.events.FocusEvent;
   import flash.events.TextEvent;
   import flash.events.KeyboardEvent;
   import nslm2.modules.globalModules.facebook.event.FBEvent;
   import org.manager.DateUtils;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcFacebookInviteRewardVo;
   import nslm2.utils.WealthUtil;
   import morn.customs.expands.MornExpandUtil;
   
   public class FBInviteViewModule extends FBInviteViewUI
   {
       
      
      private const FACE_BOOK_NAMES:String = "FaceBookNames";
      
      private var _allFriendsArr:Array;
      
      private var _selectedFriendsArr:Array;
      
      private var _allCount:uint;
      
      private var _rewardCount:uint;
      
      private var _saveArr:Array;
      
      private var faceBookNams:String;
      
      private var appTimeObj;
      
      public function FBInviteViewModule()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,btn_onClick);
         panelBg.txt_titleName.text = LocaleMgr.ins.getStr(999000800);
      }
      
      private function btn_onClick(param1:Button, param2:MouseEvent) : void
      {
         var _loc5_:* = null;
         var _loc7_:* = null;
         var _loc4_:* = null;
         var _loc8_:* = null;
         var _loc3_:* = null;
         var _loc6_:* = null;
         var _loc9_:int = 0;
         var _loc10_:* = param1;
         if(selectAllBtn !== _loc10_)
         {
            if(disselectAllBtn !== _loc10_)
            {
               if(inviteFriendsBtn === _loc10_)
               {
                  _saveArr = [];
                  _loc7_ = selectedFriendsList.array;
                  _loc4_ = [];
                  faceBookNams = "";
                  _loc8_ = "";
                  _loc6_ = [];
                  _loc9_ = 0;
                  while(_loc9_ < _loc7_.length)
                  {
                     _loc3_ = _loc7_[_loc9_];
                     if(_loc3_)
                     {
                        if(_loc4_.length == 49)
                        {
                           _loc8_ = _loc4_.join(",");
                           CallJsMrg.ins.uInvite(_loc8_,LocaleMgr.ins.getStr(999000801),LocaleMgr.ins.getStr(999000802),ClientConfig.district.toString(),inviteStatusFun);
                           _loc4_ = [];
                           _saveArr.push(_loc6_);
                           _loc6_ = [];
                        }
                        _loc4_.push(_loc3_.id);
                        _loc6_.push(_loc3_.name);
                     }
                     _loc9_++;
                  }
                  _loc8_ = _loc4_.join(",");
                  CallJsMrg.ins.uInvite(_loc8_,LocaleMgr.ins.getStr(999000801),LocaleMgr.ins.getStr(999000802),ClientConfig.district.toString(),inviteStatusFun);
                  _saveArr.push(_loc6_);
                  _loc6_ = [];
               }
            }
            else
            {
               ArrayUtil.append(_allFriendsArr,_selectedFriendsArr);
               if(inputTxt.style == "普通说明" && inputTxt.text != "")
               {
                  inputTxtHandle(null);
               }
               else
               {
                  setAllFriendsList(_allFriendsArr);
               }
               _selectedFriendsArr = [];
               setSelectFriendsList(_selectedFriendsArr);
            }
         }
         else
         {
            _loc5_ = allFriendsList.array;
            ArrayUtil.append(_selectedFriendsArr,_loc5_);
            _allFriendsArr = ArrayUtil.differenceBetweenArrs(_allFriendsArr,_loc5_);
            setAllFriendsList([]);
            setSelectFriendsList(_selectedFriendsArr);
         }
      }
      
      private function inviteStatusFun(param1:*) : void
      {
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:* = null;
         var _loc2_:* = null;
         var _loc8_:int = 0;
         var _loc7_:int = 0;
         if(param1)
         {
            AlertUtil.float(LocaleMgr.ins.getStr(999000811));
            if(_saveArr && _saveArr.length > 0)
            {
               _loc6_ = _saveArr.shift();
               Log.info("Your request has been sent ---> 去除数组");
               _loc3_ = LocalData.insTools.load("FaceBookNames",[]);
               _loc2_ = [];
               _loc8_ = 0;
               while(_loc8_ < _loc6_.length)
               {
                  _loc5_ = _loc6_[_loc8_] as String;
                  if(_loc5_)
                  {
                     param1 = {};
                     param1.saveTime = ServerTimer.ins.date;
                     param1.nameStr = _loc5_;
                     _loc3_.push(param1);
                     _loc7_ = 0;
                     while(_loc7_ < _selectedFriendsArr.length)
                     {
                        _loc4_ = _selectedFriendsArr[_loc7_] as Object;
                        if(_loc4_ && _loc4_.name == _loc5_)
                        {
                           _loc2_.push(_loc4_);
                        }
                        _loc7_++;
                     }
                  }
                  _loc8_++;
               }
               _selectedFriendsArr = ArrayUtil.differenceBetweenArrs(_selectedFriendsArr,_loc2_);
               LocalData.insTools.save("FaceBookNames",_loc3_);
               Log.info("本地缓存数组，数组的长度为：" + _loc3_.length);
            }
            else
            {
               Log.info("Your request has been sent ---> 数组中没有数据");
               return;
            }
         }
         else
         {
            if(_saveArr && _saveArr.length > 0)
            {
               _saveArr.shift();
               Log.info("发送失败！ ---> 去除数组");
            }
            AlertUtil.floatErr(LocaleMgr.ins.getStr(999000812));
         }
         updateView();
      }
      
      override public function preShow(param1:Object = null) : void
      {
         super.preShow(param1);
         ServerEngine.ins.send(10001,null,onFaceBookInvite);
         allFriendsList.itemRender = FBAllFriendsListRender;
         selectedFriendsList.itemRender = FBSelectedFriendsListRender;
         inputTxt.addEventListener("focusIn",focusInHandle);
         inputTxt.addEventListener("focusOut",focusOutHandle);
         inputTxt.textField.addEventListener("textInput",inputTxtHandle);
         inputTxt.addEventListener("keyDown",onKeyDown);
         FBControl.instance.addEventListener("addFriend",addFriend);
         FBControl.instance.addEventListener("removeFriend",removeFriend);
         rewardItemList.array = [];
         inviteBox.visible = false;
         rewardBox.visible = false;
         if(EnvConfig.ins.ptId == 686)
         {
            logoImage.skin = "png.uiFacebook.logo_ru";
         }
         else if(RTools.cl(true,false))
         {
            logoImage.skin = "png.uiFacebook.logo_en";
         }
         else
         {
            logoImage.skin = "png.uiFacebook.logo_tw";
         }
      }
      
      private function onFaceBookInvite(param1:FacebookInviteRes) : void
      {
         _rewardCount = param1.times;
         CallJsMrg.ins.invitableFriends(updataList);
      }
      
      protected function focusInHandle(param1:FocusEvent) : void
      {
         if(inputTxt.style == "普通灰色")
         {
            inputTxt.text = "";
            inputTxt.style = "普通说明";
         }
      }
      
      protected function focusOutHandle(param1:FocusEvent) : void
      {
         if(inputTxt.text == "")
         {
            inputTxt.text = LocaleMgr.ins.getStr(999000803);
            inputTxt.style = "普通灰色";
         }
         inputTxtHandle(null);
      }
      
      protected function inputTxtHandle(param1:TextEvent) : void
      {
         if(appTimeObj)
         {
            App.timer.clearTimer(appTimeObj);
         }
         appTimeObj = App.timer.doOnce(100,inputTxtHandle1);
      }
      
      private function inputTxtHandle1() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc5_:int = 0;
         App.timer.clearTimer(appTimeObj);
         var _loc3_:String = inputTxt.text.toUpperCase();
         var _loc4_:Array = [];
         _loc5_ = 0;
         while(_loc5_ < _allFriendsArr.length)
         {
            _loc2_ = _allFriendsArr[_loc5_];
            _loc1_ = String(_loc2_.name).toUpperCase();
            if(_loc2_ && (_loc1_ == _loc3_ || _loc1_.indexOf(_loc3_) != -1))
            {
               _loc4_.push(_loc2_);
            }
            _loc5_++;
         }
         if(_loc4_.length > 0)
         {
            setAllFriendsList(_loc4_);
         }
         else if(inputTxt.style == "普通灰色")
         {
            setAllFriendsList(_allFriendsArr);
         }
         else
         {
            setAllFriendsList(_allFriendsArr);
         }
      }
      
      protected function onKeyDown(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == 8 || param1.keyCode == 46 || param1.keyCode == 13)
         {
            inputTxtHandle(null);
         }
      }
      
      protected function addFriend(param1:FBEvent) : void
      {
         _allFriendsArr = ArrayUtil.differenceBetweenArrs(_allFriendsArr,[param1.data]);
         _selectedFriendsArr.push(param1.data);
         if(inputTxt.style == "普通说明" && inputTxt.text != "")
         {
            inputTxtHandle(null);
         }
         else
         {
            setAllFriendsList(_allFriendsArr);
         }
         setSelectFriendsList(_selectedFriendsArr);
      }
      
      protected function removeFriend(param1:FBEvent) : void
      {
         _selectedFriendsArr = ArrayUtil.differenceBetweenArrs(_selectedFriendsArr,[param1.data]);
         _allFriendsArr.push(param1.data);
         if(inputTxt.style == "普通说明" && inputTxt.text != "")
         {
            inputTxtHandle(null);
         }
         else
         {
            setAllFriendsList(_allFriendsArr);
         }
         setSelectFriendsList(_selectedFriendsArr);
      }
      
      override public function show(param1:Object = null) : void
      {
         super.show(param1);
      }
      
      private function getFriendsArr(param1:Array) : Array
      {
         var _loc5_:* = null;
         var _loc9_:* = null;
         var _loc8_:* = null;
         var _loc2_:Boolean = false;
         var _loc4_:* = null;
         var _loc11_:* = null;
         var _loc7_:* = null;
         var _loc12_:int = 0;
         var _loc10_:int = 0;
         Log.info("非游戏好友：" + param1.length);
         var _loc6_:* = [];
         var _loc3_:Array = LocalData.insTools.load("FaceBookNames",[]);
         if(_loc3_.length == 0)
         {
            _loc6_ = param1;
         }
         else
         {
            _loc5_ = [];
            _loc7_ = ServerTimer.ins.date;
            _loc12_ = 0;
            while(_loc12_ < param1.length)
            {
               _loc9_ = param1[_loc12_] as Object;
               if(_loc9_)
               {
                  _loc8_ = _loc9_.nameStr;
                  _loc2_ = false;
                  _loc10_ = 0;
                  while(_loc10_ < _loc3_.length)
                  {
                     _loc4_ = _loc3_[_loc10_] as Object;
                     if(_loc4_)
                     {
                        if(_loc4_.nameStr == _loc8_)
                        {
                           _loc2_ = true;
                           _loc11_ = _loc4_.saveTime as DateUtils;
                           if(_loc7_.fullYear == _loc11_.fullYear && _loc7_.month == _loc11_.month && _loc7_.date == _loc11_.date)
                           {
                              _loc5_.push(_loc4_);
                           }
                           else
                           {
                              _loc6_.push(_loc9_);
                           }
                        }
                     }
                     _loc10_++;
                  }
                  if(!_loc2_)
                  {
                     _loc6_.push(_loc9_);
                  }
               }
               _loc12_++;
            }
            LocalData.insTools.save("FaceBookNames",_loc5_);
         }
         Log.info("今日没有邀请过的好友：" + _loc6_.length);
         _loc6_.length > 2?ArrayUtil.randomArr(_loc6_):0;
         return _loc6_;
      }
      
      private function updataList(param1:*) : void
      {
         Log.info("Invite --> JS调用成功！");
         _allFriendsArr = getFriendsArr(param1 as Array);
         _selectedFriendsArr = [];
         _allCount = _allFriendsArr.length;
         var _loc2_:StcFacebookInviteRewardVo = StcMgr.ins.getFacebookInviteRewardVo(1);
         rewardItemList.array = WealthUtil.costStrToArr(_loc2_.reward);
         rewardItemList1.array = WealthUtil.costStrToArr(_loc2_.reward);
         updateView();
      }
      
      private function updateView() : void
      {
         if(_selectedFriendsArr.length > 0 || _allFriendsArr.length > 0)
         {
            inviteBox.visible = true;
            rewardBox.visible = false;
            setAllFriendsList(_allFriendsArr);
            setSelectFriendsList(_selectedFriendsArr);
         }
         else
         {
            inviteBox.visible = false;
            rewardBox.visible = true;
         }
      }
      
      private function test() : void
      {
         _allFriendsArr = getFriendsArr([{
            "id":"AVkgK9fLFxasdvXNbDV_gYogR6lXa9SKLnH...",
            "name":"Anita Sujarit",
            "picture":{"data":{
               "is_silhouette":false,
               "url":"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/t1.0-1/c0.0.50.50/p50x50/1470158_10201991701127909_302023572_t.jpg"
            }}
         },{
            "id":"AVlzYTkXshfBqLe58zR9tY5dZ7L0wltTUkWKT0Z5V87zkwv-39...",
            "name":"Guy Cross",
            "picture":{"data":{
               "is_silhouette":false,
               "url":"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn1/t5.0-1/623782_622770420_2109148508_q.jpg"
            }}
         }]);
         _selectedFriendsArr = [];
         _allCount = _allFriendsArr.length;
         var _loc1_:StcFacebookInviteRewardVo = StcMgr.ins.getFacebookInviteRewardVo(1);
         rewardItemList.array = WealthUtil.costStrToArr(_loc1_.reward);
         rewardItemList1.array = WealthUtil.costStrToArr(_loc1_.reward);
         updateView();
      }
      
      private function setAllFriendsList(param1:Array) : void
      {
         if(param1 && param1.length > 0)
         {
            selectAllBtn.disabled = false;
            allFriendsList.dataSource = param1;
            allFriendsList.visible = true;
            allFriendsTxt.visible = false;
         }
         else
         {
            selectAllBtn.disabled = true;
            allFriendsList.dataSource = [];
            allFriendsList.visible = false;
            allFriendsTxt.visible = true;
         }
      }
      
      private function setSelectFriendsList(param1:Array) : void
      {
         if(param1 && param1.length > 0)
         {
            disselectAllBtn.disabled = false;
            selectedFriendsList.dataSource = param1;
            selectedFriendsList.visible = true;
            selectedFriendsTxt.visible = false;
            inviteFriendsBtn.disabled = false;
         }
         else
         {
            disselectAllBtn.disabled = true;
            selectedFriendsList.dataSource = [];
            selectedFriendsList.visible = false;
            selectedFriendsTxt.visible = true;
            inviteFriendsBtn.disabled = true;
         }
         countTxt.text = LocaleMgr.ins.getStr(999000804,[param1 && param1.length > 0?param1.length.toString():"0",_allCount]);
      }
      
      override public function preClose(param1:Object = null) : void
      {
         super.preClose(param1);
      }
      
      override public function close(param1:Object = null) : void
      {
         super.close(param1);
      }
      
      override public function dispose() : void
      {
         super.dispose();
      }
   }
}
