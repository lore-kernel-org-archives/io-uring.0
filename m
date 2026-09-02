Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265D748C8D7
	for <io-uring@vger.kernel.org>; Wed,  2 Sep 2026 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356423; cv=pass; b=VvMSjuv+pglpFgoc4dBX5mLP3idSDJ54B0GjRwxNTWUACI82u0xiBW1LgQujS3u02oipIE6q8fNYpjAN8Kx4SdzlPed8hzrEU0nHIGL13M50KnNPGbWTxI9/1XOfHrWDLUFz7DAuK9FNETLrcyi9VBJhVxemmURJfIgTmt0T9Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356423; c=relaxed/simple;
	bh=t00JTA5JI17KHSj4FG9gzzx0ktA1h2Ge/6wt8hj4nsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F4GItXWS9m+xcwFUf+aKSGF8BXk4lvN/CaiJO67GP/B9SKitl/g59CRnYt9zsud1pTjChk2/aInTifpXa882zO+tn5UmV2tbqx2yf5N+2lYEdAAHVXHnCPPsPyMbjaoT841vHHV7V2oPY8RJhuvk5r7kqLUvpiLhMIbWoVTcecI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHb8yMFo; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHb8yMFo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so9184205ad.1
        for <io-uring@vger.kernel.org>; Wed, 02 Sep 2026 06:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788356420; cv=none;
        d=google.com; s=arc-20260327;
        b=H0LKE12Yi+Pk4RlCg3nhxIWV3gT+xAqzPhGHZZC3rjypMNDptDROfIyAnN9mxWVEpG
         d2PrQcDc4JcY3IZx+AgKvvMJl26PIDCLl5fT0RmLCOt+K0QphW/cAAjmL4UGaJfp+zzE
         mtR4iYdsCxdqQPDBMvjv27IueEcY8Dun/km2mer6BV46YsWsnYVpgGWBpGb+4b77U5H6
         OBcENgJSQrllbPlqsglZ8ZEUdD6Z2LUb1ox5T7+JOaWD6TraBoJZ/TwiYamkkn2QZQ/h
         tScD0aanSMOjPZO8Q5PZhXoNe1O5OXGxHfMNEU8un/JbFzXLwt1twuvgimQbCo6O26Im
         gStg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t00JTA5JI17KHSj4FG9gzzx0ktA1h2Ge/6wt8hj4nsM=;
        fh=oepqAuWi9lWLVilK2+JOzqp52FT1ueWomAHQnOjyhfg=;
        b=gM1Cbh6mCF1VT2Pi3bQFtSQweCgIVRbOne2A9og8yGbXIQgggbLFJg6GZRTW5AV4mD
         aMm+/dIhNhvgF/gcfj9w02w4lPNPMgN4DKZRU7CUSkpUp1edatRMPZ0j/+tKIWxTY/ka
         7ikm0Tabu2OiJDyQmI3SwDNeAMwxi6tQs0IEDUl8EJJlY3blZupBRV7aL40xgkgo4tvi
         oaJNJJ8E9FRHZv+lo0tD44HFi1wXDt01MNR0m13LfGesOVw6oZ6eOHhzHKgo/aKNRHK8
         3Cx83IpgkV0ohiB4aJ/Mpk+0OWwcyn2BPMSW+uWiNdlhBai/JDU76FHv3TaJuA9ikdfF
         Noqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788356420; x=1788961220; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t00JTA5JI17KHSj4FG9gzzx0ktA1h2Ge/6wt8hj4nsM=;
        b=NHb8yMFoBqqCwpylVvR55G8aD0dbxTFv539qhxaCQPx5IiDblhOEJyqJfK1EclGx1H
         +KYw9GDrodDkOPUI3tS/7Siw3mv1tulmmlw129cL9sFTAKsplB5rpqa/h3/WbMBNhlnd
         fHRHIQrN7TepLeufFHgr96mmQ3VEtQsQLq+Y/HsojjA6dK5oKqjlHk3UYYOcNpyFJKf9
         Xa5o0EAuAzxRM1Go8fpAworzQLP5APLJSN0HVM7iWi1sdGYC9eY4qJh/jiNhA6GwjNJS
         cHlrd1uogj0MrFg1atTF7yV12PpkcMdrI/ilI3nR/Snd9zhzannUNfZpVxAzoARhFXzb
         mPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356420; x=1788961220;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t00JTA5JI17KHSj4FG9gzzx0ktA1h2Ge/6wt8hj4nsM=;
        b=GpnxRxFjylH0686pKm0KoTYs3qI89kd7C6biNFCPE/tu/+XjtcJXjdquAKRDLEYWq2
         DH9xcft8mtJaT5Xqg3e0oEueebX3IW/PW0s4jYiZlQULwVcOl+RdLWPE0Verx4mhYMoM
         xplq33Jy+ixqjOgj+Yaoh8eB46WnfbQhshtf8cjSns6Qbx505dZ+o2Uhsebz1CQkBkeQ
         zqd3Yu4EPOt73SgaA51p/65OKFJC0GLLmlh2fISJzQlOQftfCYecjtMwzrjF5jWE37Y1
         GH45rGhHQl1s5oqm4wi9u6Zy/VFzDKNQxhHNz52vbX384EigtAsCxtSOhEsfQBA+Q3hE
         XwOQ==
X-Forwarded-Encrypted: i=1; AKwUvBygV8pkOW1JGi2ToCQljww5Zh3seojNBFhRgL8hcgURhvgxg0GqQXfArhwiavxOFXa0avhue9z/AA==@vger.kernel.org
X-Gm-Message-State: AFuF++m2aX5epcJlLMDi0wD1z3595xfFgMqbBSdq2xa1VWAkqvzDgiFC
	KIJRCG99AIwNR8Mf33ZZS/XxNZHjlqTtLWNxiTUA5iLqyyenWmu6csQDSnbKtmQkbsNmOEfmzLt
	WbNflMhGrbYpXYfp/UxVWzL87YuB/4LE=
X-Gm-Gg: AYBFou17B8UsQe48AUDT9W/nr/yyvlN0MfOWTw4tWKrBj+ipUVpDYTGtiQS7cbeJzVJ
	A9iTSC52XgLeCjvetJMOqmnlrWkcytQwU16DqfGPRiT8sKIZ1Eg5weOTEGMoaL1TE7a7sAebOnl
	U2ws1NcwjE7zu8bTNtj7cY6Vbf+A5aA/Vib1IBd+LMN+ZtXVmVzXuk4+4tf9+JOxFnRCqW0YovU
	lEZq4S4voXrYkSYZS7jtsTOIx7TLj2snyCSdYTTJF4WlubIn/2qawRa48fAN3g44eqmx0CKeHrs
	2V/zFxtvwz/oQc3NtnDbvj5I14JQgNQObJsGmKEOK6KxSm1QxD0pkNds1pp55G3cfuVIvmMBJnU
	3
X-Received: by 2002:a17:903:3810:b0:2c6:90ec:f601 with SMTP id
 d9443c01a7336-2daec5e6457mr50995905ad.8.1788356420282; Wed, 02 Sep 2026
 06:40:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624073921.11037-1-harshal24.chavan@gmail.com>
 <20260624124019.4521-1-harshal24.chavan@gmail.com> <87fr2auzq3.fsf@mailhost.krisman.be>
 <CADCAkb6wuR7vT3chfFtBL0qma+gx-2mJM7v+JJLS00W3oyb5dg@mail.gmail.com> <CADCAkb63_kAa0b09GAQApBqi9-oUR03beQajkSMKL6Q4bkpWWg@mail.gmail.com>
In-Reply-To: <CADCAkb63_kAa0b09GAQApBqi9-oUR03beQajkSMKL6Q4bkpWWg@mail.gmail.com>
From: Harshal Chavan <harshal24.chavan@gmail.com>
Date: Wed, 2 Sep 2026 19:10:07 +0530
X-Gm-Features: AcwNN1VUjqEwRgnK6GyRmJMkrEFmdiPSGjgCIvG4yM_VLNIiC17js23pm59iOGU
Message-ID: <CADCAkb6s_M--WheFHQny=iGWx9WKpk9bpsjkxaHMszxUCPtR9A@mail.gmail.com>
Subject: Re: [PATCH v6] io_uring/register: add IORING_REGISTER_CLONE_FILES opcode
To: Gabriel Krisman Bertazi <krisman@suse.de>, axboe@kernel.dk
Cc: gregkh@linuxfoundation.org, gustavoars@kernel.org, 
	io-uring@vger.kernel.org, kees@kernel.org, linux-hardening@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Jens,

Just a gentle ping
As a quick refresher: Gabriel reviewed the recent changes.
We are just waiting for your high-level thoughts regarding the overall approach.

Thanks,
Harshal
