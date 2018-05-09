//
// Wire
// Copyright (C) 2018 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//

import XCTest
@testable import Wire

final class TermsOfUseStepViewControllerSnapshotTests: ZMSnapshotTestCase {
    
    var sut: TermsOfUseStepViewController!
    var mockDevice: MockDevice!

    override func setUp() {
        super.setUp()

        sut = TermsOfUseStepViewController()
        mockDevice = MockDevice()

        recordMode = true
    }
    
    override func tearDown() {
        sut = nil
        mockDevice = nil

        super.tearDown()
    }


    func testTestForIPhoneSize() {
        self.verify(view: sut.view)
    }

    func testTestForIPadSize() {
        // GIVEN
        mockDevice.userInterfaceIdiom = .pad

        // WHEN
        sut.createContainerView()
        sut.createTitleLabel()
        sut.createTermsOfUseText()
        sut.createAgreeButton()
        sut.updateViewConstraints(device: mockDevice)
        sut.view.frame = CGRect(origin: .zero, size: CGSize(width: 768, height: 1024))

        // THEN
        self.verify(view: sut.view)
    }
}
