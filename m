Received: from devnull.danielhodges.dev (vps-2f6e086e.vps.ovh.us [135.148.138.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE70F342538;
	Sat, 14 Mar 2026 13:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=135.148.138.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773496262; cv=none; b=mcQIx0hUGDrWr6NJS+HfeHYJg3Iw9qvKx5PQlcRsVNu81HylYyKFcFAjuMtS4NrIsw8M0WUKAbVeZJFXlAfJtQiIpjMgyGsV5hoLxTO7haOedahUrJLPObSYRzwq5bTS/dZ/oLssTlIcg1Ej2KNdQboLRtbxNVv4DSeP/lnJp9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773496262; c=relaxed/simple;
	bh=ICyPwHW3A/ZbPZRRet9jdEnLucnYt22E4o5iyKNWBIg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QQowW0UWxQ34vdQwDHQr0SyAcJSluuHb/5nU0c1KISeGB9iSq9NGjPZSTtaWUfziylV3qX3+7O98dzw8SqznJnJymtjfAS7Qp/dvLJO9T5lysiNseXBv4dQy2VTJvMqK10RgLbZCrShQFbpd7qY5EdzqFysX6R+Xvq3iRNSheI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danielhodges.dev; spf=pass smtp.mailfrom=danielhodges.dev; dkim=pass (2048-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b=rLGtpKLl; dkim=permerror (0-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b=ObObstGl; arc=none smtp.client-ip=135.148.138.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=danielhodges.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=danielhodges.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b="rLGtpKLl";
	dkim=permerror (0-bit key) header.d=danielhodges.dev header.i=@danielhodges.dev header.b="ObObstGl"
DKIM-Signature: v=1; a=rsa-sha256; s=202510r; d=danielhodges.dev; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1773496253; bh=SA3xR+qrXwEs4U3cgOKPkes
	o5y9bQ+ljAOtWq36xNIg=; b=rLGtpKLlDQzpSKsQrb16Hezpw0lz9ipGtOiZ+GW8fnvYUME/K2
	9y1tu7DWL4HAXJPzvFmlaa27klWWCbJE7eTfyWpT7LxXmy8bZfpuSOQVfJTgsHoKsZYMtrMpGED
	GcuUNxJ29+oFKf9OuasvF8sgc4xTtDYr/895sdk0ApjEueXCIEc7fHVcGiCLpyvb2nO8AfwPctF
	xzDbZi+0RKyyEEGMWVRyhdVYJwWTVBiOiYFnYVae7nn2Sj9g2juK1s3fnU1Ve792mMl9J4aZ4kg
	XrJVx9NbWrKZ5TnR0b4Or9n0uQuXhbKvbrHZA90noanFknmuVpUz+HkF3Eh06lv6utw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202510e; d=danielhodges.dev; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1773496253; bh=SA3xR+qrXwEs4U3cgOKPkes
	o5y9bQ+ljAOtWq36xNIg=; b=ObObstGlNEGklR+oXnVrMM8Q12WV6mQluhntGP8Lx7RGcrJTV1
	L5Onf0YIpSEk3Bygv6xiTBEK2UGHRT04P6AQ==;
From: Daniel Hodges <git@danielhodges.dev>
To: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/2] io_uring: add IPC channel infrastructure
Date: Sat, 14 Mar 2026 09:50:53 -0400
Message-ID: <20260314135053.3334-1-git@danielhodges.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260313130739.23265-1-git@danielhodges.dev>
References: <20260313130739.23265-1-git@danielhodges.dev>
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Mar 13, 2026 at 01:07:37PM +0000, Daniel Hodges wrote:
> Performance (virtme-ng VM, single-socket, msg_size sweep 64B-32KB):
>
>   Point-to-point latency (64B-32KB messages):
>     io_uring unicast: 597-3,185 ns/msg (within 1.5-2.5x of pipe for small msgs)

Benchmark sources used to generate the numbers in the cover letter:

  io_uring IPC modes (broadcast, multicast, unicast):
    https://gist.github.com/hodgesds/fbcd8bb8497bc0ec2bf1f95244a984fe#file-io_uring_ipc_bench-c

  IPC comparison (pipes, unix sockets, shm+eventfd):
    https://gist.github.com/hodgesds/fbcd8bb8497bc0ec2bf1f95244a984fe#file-ipc_comparison_bench-c
