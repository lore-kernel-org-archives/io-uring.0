Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795305923;
	b=mpEMandBnChy+j4thqMzrJohOioGe1Aglr7LP0m4ksi7YxLq3mfdkJ1Dm0F7SYmvy1Xn
	 8kTa4ci+JNiiPzf05FDFQO1hkaNiNk/0O3tvDrTMAt3qypuG4A60VlFuWSvkOa5h7L/iy
	 6/KhCTd+Q8X8NaPIs0tvQSKtHJ6StcPFaTC8eENFKIjgsU9kr/ZqISi5ALE9GvsJuKtP8
	 H7ZGUjEduVP+rC/QkoanRxQNbxHrlcPaV0PKgN94GRQTbFBARxCM38vLjDgczDleDJ5Q7
	 /66E4k5fuwAg02GMex/+hZfUk9pZM9MA8knTEJtDc9aizFeISq3Mv0PLONdUVVxQrFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795305923;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type;
	bh=GjZ15nH+Zr9dV+VfJP4mz2smNi+U2Ekt9QMOm/mP68c=;
	b=ei6o0h5ZYwmS1k3En4FfrDaOQHPYzPvdSB9l9fJ3jHsFB7s+rD/RDw82nNFdTi2QnasJ
	 nRdDCQbVbbc5Ylx8FZYpNqYfUrVbTkjWFXkMs3qma0lBpSAUYDP1D95srXkxGYgbklHkG
	 G1maMpHxGiDTgE/1zR42rFGUWHbMPou54+CwAuO3b0OlEGs5MERFgyRRWHTQtcwKyT+hx
	 8rkOmXgBGQ6C1zAhdrzceFYCb6kEVGa/GG88r3KHY1XF4ra+JxHuZ5f6nJAhJIsSwpSFB
	 SwAHayQEMzCMn8rbaeedqVX7VwrfwObxKIFbiF5Xq8BoQ8PgtMSAFrCVR08HMQCzCCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=f5c2wPln;
	arc=none smtp.remote-ip=185.70.43.25
Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B2D606A320;
	Sun, 22 Nov 2026 00:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00B2D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=f5c2wPln
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1795305920; x=1795565120;
	bh=GjZ15nH+Zr9dV+VfJP4mz2smNi+U2Ekt9QMOm/mP68c=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=f5c2wPlnjKmm2QADBvoaVdvS2RlJI75kJu9QhfH6gB6I1860erVlK0FcvwrTdQ5HS
	 2HvN2M49tDYHjo+fmAG2QMLK2dOcx0msRyIYHvw6VOV2z9ahCPVzDPwIT7ZcIRAJVE
	 /Y1t7C9bAE+rqd1YbbjEeSyf30A1oKTaN5e2AzsiFLhwmt+p4ObUp3fKK8gr2OvnZ9
	 kvzqi0pRCPO1OLRVceje2OhbppdYKd6erAIpLz7qR5JCUrpNBsatQZH/Jb7KrXIUrh
	 Dokc7df1Aw8/9qk8THLzNPMWIkE4w1j0i77Y9Lw3x/c+zlmXapLZBVUZN29r62JmDl
	 oVEVL27kGJULw==
Date: Sun, 22 Nov 2026 00:05:17 +0000
To: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, "christian.koenig@amd.com" <christian.koenig@amd.com>
From: Falconet3 <Falconet3@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "axboe@kernel.dk" <axboe@kernel.dk>, "io-uring@vger.kernel.org" <io-uring@vger.kernel.org>, "asml.silence@gmail.com" <asml.silence@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] dma-buf: fix leak of ctx and dmabuf reference in dma_buf_io_ctx_create() WARN path
Message-ID: <htm5h9oaY-vk0g9JVYJmz5XCaKe_nPoWkUJYJqDulyNvv_sAWfzSMp0T6GWt5okc8R4SyvXXpJQ3VGhetKnjEa2KGem5uCYdxpmdzUFf6XA=@proton.me>
Feedback-ID: 48740069:user:proton
X-Pm-Message-ID: 702b096feba5ccb2efa67b42272d49e6cc5e4207
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="b1=_abzXme9ze1hXxLPsku0U8W6cWhzMpEqIMQF3RF8w4"

--b1=_abzXme9ze1hXxLPsku0U8W6cWhzMpEqIMQF3RF8w4
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

(leak of ctx + dmabuf ref on the WARN_ON_ONCE path, new file in v7.4-rc1, p=
atch attached)
--b1=_abzXme9ze1hXxLPsku0U8W6cWhzMpEqIMQF3RF8w4
Content-Type: text/x-patch; name=0002-dma-buf-fix-leak-in-dma_buf_io_ctx_create-WARN-path.patch
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=0002-dma-buf-fix-leak-in-dma_buf_io_ctx_create-WARN-path.patch

RnJvbTogRmFsY29uZXQzIDxGYWxjb25ldDNAcHJvdG9uLm1lPgpEYXRlOiBTYXQsIDIxIE5vdiAy
MDI2IDIxOjA1OjAwICswMDAwClN1YmplY3Q6IFtQQVRDSF0gZG1hLWJ1ZjogZml4IGxlYWsgb2Yg
Y3R4IGFuZCBkbWFidWYgcmVmZXJlbmNlIGluIGRtYV9idWZfaW9fY3R4X2NyZWF0ZSgpIFdBUk4g
cGF0aAoKVGhlIGZpbGUgZHJpdmVycy9kbWEtYnVmL2RtYS1idWYtaW8uYyAoYW5kIHRoZSBpb191
cmluZyBkbWFidWYgcmVnYnVmCmZlYXR1cmUgb24gdG9wIG9mIGl0KSBpcyBuZXcgaW4gdjcuNC1y
YzEuIEluIGRtYV9idWZfaW9fY3R4X2NyZWF0ZSgpLAp0aGUgZXJyb3IgcGF0aCBvZiBpbml0X2Rt
YV9idWZfaW9fY3R4KCkgY29ycmVjdGx5IGRvZXMKa2ZyZWUoY3R4KSArIGRtYV9idWZfcHV0KGRt
YWJ1ZikgKGRtYS1idWYtaW8uYzoxNzgtMTgyKSwgYnV0IHRoZQpXQVJOX09OX09OQ0UoKSBwYXRo
IHJpZ2h0IGJlbG93IGl0IHJldHVybnMgLUVJTlZBTCB3aXRob3V0IGZyZWVpbmcKZWl0aGVyIChk
bWEtYnVmLWlvLmM6MTg0LTE4OCk6CgoJaWYgKFdBUk5fT05fT05DRSghY3R4LT5kZXZfb3BzIHx8
IC4uLikpCgkJcmV0dXJuIC1FSU5WQUw7ICAgICAgICAgIC8qIGxlYWtzIGN0eCBhbmQgdGhlIGdl
dF9kbWFfYnVmKCkgcmVmICovCgpSZWFjaGFibGUgZnJvbSB1c2Vyc3BhY2UgdmlhIGlvX3VyaW5n
IGJ1ZmZlciByZWdpc3RyYXRpb24KKElPUklOR19SRUdJU1RFUl9CVUYgLyByc3JjIHVwZGF0ZSB3
aXRoIElPX1JFR0JVRl9UWVBFX0RNQUJVRiwKaW9fdXJpbmcvZG1hLWJ1Zi5jIC0+IGRtYV9idWZf
aW9fY3R4X2NyZWF0ZSgpKSB3aGVuZXZlciBhbiBpbXBvcnRlcidzCmluaXRfZG1hX2J1Zl9pb19j
dHgoKSBzdWNjZWVkcyBidXQgbGVhdmVzIGRldl9vcHMgaW5jb21wbGV0ZToKa2VybmVsIG1lbW9y
eSArIGRtYS1idWYgcmVmZXJlbmNlIGxlYWsgKERvUy1ncmFkZSkuCgpBZmZlY3RzIHY3LjQtcmMx
Li52Ny40LXJjMyBvbmx5OyB0aGUgZmlsZSBkb2VzIG5vdCBleGlzdCBpbiB2Ny4zLjUuCgpGaXgg
d2FzIHZlcmlmaWVkIHdpdGggZ2l0IGFwcGx5IC0tY2hlY2sgYWdhaW5zdCB2Ny40LXJjMzsgbm90
CmJ1aWxkLXRlc3RlZCBhbmQgbm8gcmVwcm9kdWNlciBhdmFpbGFibGUgaW4gdGhpcyBlbnZpcm9u
bWVudC4KCkZpeGVzOiBGSUxMLUlOLVNIQSAoImRtYS1idWY6IGludHJvZHVjZSAuLi4gZmlsZSBJ
L08gLi4uIikKQXNzaXN0ZWQtYnk6IExMTSBNaXN0cmFsIFZpYmUKU2lnbmVkLW9mZi1ieTogRmFs
Y29uZXQzIDxGYWxjb25ldDNAcHJvdG9uLm1lPgotLS0KIGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVm
LWlvLmMgfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYtaW8uYyBiL2Ry
aXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLWlvLmMKaW5kZXggMDAwMDAwMC4uMDAwMDAwMCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYtaW8uYworKysgYi9kcml2ZXJzL2RtYS1idWYv
ZG1hLWJ1Zi1pby5jCkBAIC0xNzksMTMgKzE3OSwxNiBAQCBpbnQgZG1hX2J1Zl9pb19jdHhfY3Jl
YXRlKHN0cnVjdCBmaWxlICpmaWxlLAogCQlrZnJlZShjdHgpOwogCQlkbWFfYnVmX3B1dChkbWFi
dWYpOwogCQlyZXR1cm4gcmV0OwogCX0KIAogCWlmIChXQVJOX09OX09OQ0UoIWN0eC0+ZGV2X29w
cyB8fAogCQkJICFjdHgtPmRldl9vcHMtPm1hcCB8fAogCQkJICFjdHgtPmRldl9vcHMtPnVubWFw
IHx8Ci0JCQkgIWN0eC0+ZGV2X29wcy0+cmVsZWFzZSkpCi0JCXJldHVybiAtRUlOVkFMOworCQkJ
ICFjdHgtPmRldl9vcHMtPnJlbGVhc2UpKSB7CisJCWtmcmVlKGN0eCk7CisJCWRtYV9idWZfcHV0
KGRtYWJ1Zik7CisJCXJldHVybiAtRUlOVkFMOworCX0KIAogCSpvdXRfY3R4ID0gY3R4OwogCXJl
dHVybiAwOwotLSAKMi41My4wCg==

--b1=_abzXme9ze1hXxLPsku0U8W6cWhzMpEqIMQF3RF8w4--

